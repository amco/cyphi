defmodule Cyphi.Client.Response do
  @moduledoc false

  alias Cyphi.Client.Caster

  @doc """
  Decodes a successful `Req.Response` based on the HTTP status and response spec.
  """
  @spec decode({:ok, Req.Response.t()}, map()) :: {:ok, term()} | {:error, term()}
  def decode({:ok, %Req.Response{status: status, body: body}}, %{
        response: response_spec
      }) do
    case List.keyfind(response_spec, status, 0) do
      {status, {module, type}} when status in [200, 201] ->
        {:ok, decode_body(body, module, type)}

      {status, [{module, type}]} when status in [200, 201] ->
        {:ok, decode_body(body, module, type)}

      {status, _} when status in [200, 202, 204] ->
        {:ok, body}

      _ ->
        {:error, body}
    end
  end

  def decode({:error, reason}, _) do
    {:error, reason}
  end

  defp decode_body(list, module, type) when is_list(list) do
    Enum.map(list, &parse(module, &1, type))
  end

  defp decode_body(map, module, type) when is_map(map) do
    parse(module, map, type)
  end

  defp parse(module, map, type) do
    attrs =
      module.__fields__(type)
      |> Enum.reduce(%{}, fn {field, field_type}, acc ->
           key = Atom.to_string(field)
           value = Map.get(map, key)

           Map.put(acc, String.to_existing_atom(key), Caster.cast(value, field_type))
         end)

    struct(module, attrs)
  end
end
