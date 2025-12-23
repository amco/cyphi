defmodule Cyphi.Client.RequestTest do
  use ExUnit.Case, async: false

  alias Cyphi.Client.Request

  @api_key Application.compile_env(:cyphi, :api_key)

  describe "encode/1" do
    test "starts with empty opts and adds default json content-type" do
      opts = Request.encode(%{})
      headers = opts[:headers]

      assert {"content-type", "application/json"} in headers
    end

    test "injects api key from environment into headers" do
      opts = Request.encode(%{})
      headers = opts[:headers]

      assert {"x-api-key", @api_key} in headers
    end

    test "passes through query parameters" do
      params = %{page: 1, sort: "desc"}
      opts = Request.encode(%{query: params})

      assert opts[:params] == params
    end
  end

  describe "encode/1 accept headers" do
    test "adds Accept header for standard list format [type, schema]" do
      req = %{request: ["application/pdf", :schema_ref]}
      opts = Request.encode(req)

      assert {"Accept", "application/pdf"} in opts[:headers]
    end

    test "adds Accept header for tuple list format [{type, schema}]" do
      req = %{request: [{"application/vnd.api+json", :schema_ref}]}
      opts = Request.encode(req)

      assert {"Accept", "application/vnd.api+json"} in opts[:headers]
    end

    test "does not add Accept header if request list is empty" do
      req = %{request: []}
      opts = Request.encode(req)

      header_keys = Enum.map(opts[:headers], &elem(&1, 0))
      refute "Accept" in header_keys
    end

    test "ignores missing request key" do
      opts = Request.encode(%{other: 123})
      assert opts[:params] == nil
    end
  end

  describe "encode/1 body" do
    test "encodes a map body into JSON string" do
      body = %{foo: "bar", baz: 123}
      opts = Request.encode(%{body: body})

      assert is_list(opts)
      assert is_binary(opts[:body])

      assert {:ok, decoded} = Jason.decode(opts[:body])
      assert decoded["foo"] == "bar"
      assert decoded["baz"] == 123
    end

    test "normalizes keyword lists in body to JSON objects" do
      body = [name: "Elixir", type: "Language"]
      opts = Request.encode(%{body: body})

      assert {:ok, decoded} = Jason.decode(opts[:body])
      assert decoded == %{"name" => "Elixir", "type" => "Language"}
    end

    test "handles lists of maps correctly" do
      body = [%{id: 1}, %{id: 2}]
      opts = Request.encode(%{body: body})

      assert {:ok, decoded} = Jason.decode(opts[:body])
      assert decoded == [%{"id" => 1}, %{"id" => 2}]
    end

    test "returns error tuple when body cannot be encoded" do
      invalid_body = %{pid: self()}
      result = Request.encode(%{body: invalid_body})

      assert {:error, msg} = result
      assert msg =~ "Invalid request body:"
      assert msg =~ "Jason.Encoder"
    end
  end
end
