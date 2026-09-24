defmodule Cyphi.Generator.Renderer do
  @moduledoc """
  Adds documented `$include` relationships missing from the upstream schemas.

  Relationships remain raw maps to preserve the client's existing nested-value
  decoding behavior. Upstream field definitions always take precedence.
  This module is compiled only in development and test environments.
  """
  use OpenAPI.Renderer

  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Schema.Field

  # Names are relative to output.base_module in the renderer's processed schemas.
  @relationships %{
    Answer => [:grade, :question, :user],
    Assistant => [:user, :course],
    Award => [:user, :awardee],
    BadgeHistory => [:badge],
    Batch => [:user],
    Course => [:parent, :current_module, :organization],
    CourseTemplate => [:organization],
    Grade => [:user, :grader, :assessment, :course],
    GroupMembership => [:user, :group],
    Instructor => [:user, :course],
    Learner => [
      :user,
      :course,
      :progress,
      :enrolled_by,
      :unenrolled_by,
      :deactivated_by,
      :reactivated_by,
      :transferred_by,
      :transferred_from,
      :transferred_to,
      :order_item
    ],
    LevelHistory => [:level],
    Module => [:course],
    Order => [:user, :organization, :verifier],
    Organization => [:parent],
    Player => [:user],
    ScormAnswer => [:grade, :user],
    Section => [:module, :referenced_course],
    Session => [:user],
    User => [:organization, :archiver, :job_title, :manager, :added_by],
    Visit => [:user]
  }

  @impl OpenAPI.Renderer
  def render_schema_types(state, schemas) do
    super(state, Enum.map(schemas, &add_relationships/1))
  end

  @impl OpenAPI.Renderer
  def render_schema_struct(state, schemas) do
    super(state, Enum.map(schemas, &add_relationships/1))
  end

  @impl OpenAPI.Renderer
  def render_schema_field_function(state, schemas) do
    super(state, Enum.map(schemas, &add_relationships/1))
  end

  @impl OpenAPI.Renderer
  def format(state, file) do
    contents = super(state, file) |> IO.iodata_to_binary()

    field_count =
      file.schemas
      |> Enum.filter(&(&1.output_format == :struct))
      |> Enum.map(&add_relationships/1)
      |> Enum.flat_map(& &1.fields)
      |> Enum.uniq_by(& &1.name)
      |> length()

    # Large API structs cannot be split without changing the public response shape.
    if field_count > 31 do
      String.replace(contents, "  defstruct ", "  # credo:disable-for-next-line\n  defstruct ",
        global: false
      )
    else
      contents
    end
  end

  defp add_relationships(%Schema{output_format: :struct, type_name: :t} = schema) do
    existing_names = MapSet.new(schema.fields, & &1.name)

    fields =
      @relationships
      |> Map.get(schema.module_name, [])
      |> Enum.map(&Atom.to_string/1)
      |> Enum.reject(&MapSet.member?(existing_names, &1))
      |> Enum.map(&%Field{name: &1, type: :map, nullable: true, required: false})

    %{schema | fields: schema.fields ++ fields}
  end

  defp add_relationships(schema), do: schema
end
