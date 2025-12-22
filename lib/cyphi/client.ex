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
         {:ok, %Req.Response{}} = response <- @adapter.send_request(method, url, req_opts) do
      Response.decode(response, opts)
    else
      _ -> {:error, "Invalid request"}
    end
  end

  defp build_url(path) do
    "#{url()}#{path}"
  end

  defp url do
    Application.get_env(:cyphi, :api_url)
  end
end
