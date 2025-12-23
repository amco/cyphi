defmodule Cyphi.Client do
  @moduledoc """
  This module serves as the central interface for interacting with the Cypher Learning
  Matrix OpenAPI. It handles request construction (headers, authentication, and encoding),
  executes network calls via a configurable adapter, and transforms JSON responses
  into Elixir structs.
  """

  alias __MODULE__.{Request, Response}

  @adapter Application.compile_env(:cyphi, :http_adapter, Cyphi.HttpAdapter.Req)

  @spec request(map()) :: {:ok, term()} | {:error, term()}
  def request(%{method: method, url: path} = opts) do
    with req_opts <- Request.encode(opts),
         url <- build_url(path),
         true <- valid_url?(url),
         {:ok, %Req.Response{}} = response <- @adapter.send_request(method, url, req_opts) do
      Response.decode(response, opts)
    else
      _ -> {:error, "Invalid request"}
    end
  end

  defp build_url(path) do
    "#{api_base_url()}#{path}"
  end

  defp api_base_url do
    Application.get_env(:cyphi, :api_url)
  end

  defp valid_url?(url) do
    with true <- is_binary(url) and byte_size(url) > 0,
         %URI{host: host, path: path} <- URI.parse(url) do
      path == "localhost" ||
        (is_binary(host) and byte_size(host) > 0)
    else
      _ ->
        false
    end
  end
end
