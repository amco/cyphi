defmodule Cyphi.Generator.RendererTest do
  use ExUnit.Case, async: true

  alias Cyphi.Generator.Renderer
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Schema.Field
  alias OpenAPI.Renderer.State

  setup do
    {:ok, state: %State{implementation: Renderer, profile: :renderer_test}}
  end

  test "adds optional relations consistently to types, structs, and field metadata", %{
    state: state
  } do
    schemas = [%Schema{module_name: User, type_name: :t, output_format: :struct}]

    types = Renderer.render_schema_types(state, schemas) |> Macro.to_string()
    struct_ast = Renderer.render_schema_struct(state, schemas) |> Macro.to_string()
    fields = Renderer.render_schema_field_function(state, schemas) |> Macro.to_string()

    assert types =~ "organization: map | nil"
    assert struct_ast =~ ":organization"
    assert fields =~ "organization: :map"
  end

  test "preserves upstream field definitions and does not duplicate relations", %{state: state} do
    schemas = [
      %Schema{
        module_name: User,
        type_name: :t,
        output_format: :struct,
        fields: [%Field{name: "organization", type: :string, required: true}]
      }
    ]

    for callback <- [:render_schema_types, :render_schema_struct, :render_schema_field_function] do
      rendered = apply(Renderer, callback, [state, schemas]) |> Macro.to_string()
      assert length(Regex.scan(~r/organization/, rendered)) == 1
    end

    types = Renderer.render_schema_types(state, schemas) |> Macro.to_string()
    fields = Renderer.render_schema_field_function(state, schemas) |> Macro.to_string()
    assert types =~ "organization: String.t()"
    refute types =~ "organization: map"
    assert fields =~ "organization: :string"
  end

  test "keeps the existing Answer.grade type while adding missing relations" do
    assert Cyphi.Answer.__fields__()[:grade] == :string
    assert Cyphi.Answer.__fields__()[:question] == :map
    assert Cyphi.Answer.__fields__()[:user] == :map
    assert Cyphi.Player.__fields__()[:level] == {Cyphi.PlayerLevel, :t}
  end

  test "preserves the large-struct lint exemption during regeneration", %{state: state} do
    schema = %Schema{
      module_name: Large,
      type_name: :t,
      output_format: :struct,
      fields: Enum.map(1..32, &%Field{name: "field_#{&1}", type: :string})
    }

    file = %OpenAPI.Renderer.File{
      module: Large,
      schemas: [schema],
      ast: quote(do: defmodule(Large, do: defstruct([])))
    }

    assert Renderer.format(state, file) =~ "# credo:disable-for-next-line\n  defstruct"
  end

  test "leaves unrelated schemas and non-struct request types unchanged", %{state: state} do
    for {module, format} <- [{Unrelated, :struct}, {User, :typed_map}] do
      schemas = [
        %Schema{
          module_name: module,
          type_name: :t,
          output_format: format,
          fields: [%Field{name: "id", type: :integer}]
        }
      ]

      for callback <- [:render_schema_types, :render_schema_struct, :render_schema_field_function] do
        assert apply(Renderer, callback, [state, schemas]) ==
                 apply(OpenAPI.Renderer, callback, [state, schemas])
      end
    end
  end
end
