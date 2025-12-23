defmodule Cyphi.Client.Request do
  @moduledoc """
  Prepares and encodes HTTP request options for the `Cyphi.Client`.

  This module transforms high-level request maps into adapter-compatible keywords by:
  * **Injecting Headers:** Adds default JSON content types, `Accept` headers, and the `x-api-key` for authentication.
  * **Serializing Bodies:** Encodes payloads to JSON, ensuring maps and keyword lists are normalized into ordered objects.
  * **Mapping Parameters:** Converts query parameters into the expected adapter format.
  """

  @spec encode(map()) :: keyword()
  def encode(request) do
    Keyword.new()
    |> add_default_headers()
    |> authenticate()
    |> maybe_add_accept(request)
    |> maybe_add_query(request)
    |> maybe_add_body(request)
  end

  defp add_default_headers(req_opts) do
    headers =
      Keyword.get(req_opts, :headers, []) ++
        [{"content-type", "application/json"}]

    Keyword.put(req_opts, :headers, headers)
  end

  defp maybe_add_query(req_opts, options) do
    case options do
      %{query: query} -> Keyword.put(req_opts, :params, query)
      _ -> req_opts
    end
  end

  defp maybe_add_accept(req_opts, %{request: request}) do
    headers =
      Keyword.get(req_opts, :headers, []) ++
        set_accept_header(request)

    Keyword.put(req_opts, :headers, headers)
  end

  defp maybe_add_accept(req_opts, _), do: req_opts

  defp set_accept_header([]), do: []
  defp set_accept_header([type, _]), do: [{"Accept", type}]
  defp set_accept_header([{type, _}]), do: [{"Accept", type}]

  defp authenticate(req_opts) do
    headers =
      Keyword.get(req_opts, :headers, []) ++
        [{"x-api-key", api_key()}]

    Keyword.put(req_opts, :headers, headers)
  end

  defp api_key do
    Application.get_env(:cyphi, :api_key)
  end

  defp maybe_add_body(req_opts, %{body: body}) do
    case encode_body(body) do
      {:ok, encoded} ->
        Keyword.put(req_opts, :body, encoded)

      err ->
        {:error,  "Invalid request body: #{inspect(err)}"}
    end
  end

  defp maybe_add_body(req_opts, _), do: req_opts

  defp encode_body(body) do
    body
    |> normalize_json()
    |> Jason.encode()
    |> map_encode_error()
  end

  defp normalize_json(term) when is_map(term) do
    term
    |> Map.to_list()
    |> Jason.OrderedObject.new()
  end

  defp normalize_json(term) when is_list(term) do
    case Keyword.keyword?(term) do
      true -> Jason.OrderedObject.new(term)
      false -> Enum.map(term, &normalize_json/1)
    end
  end

  defp normalize_json(term), do: term

  defp map_encode_error({:ok, _} = ok), do: ok

  defp map_encode_error(error) do
    {:error, "Error encoding body: #{inspect(error)}"}
  end
end
