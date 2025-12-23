defmodule Cyphi.HttpAdapter do
  @moduledoc """
  Defines the behaviour for HTTP adapters used by `Cyphi.Client`.

  This contract allows the HTTP backend to be swapped or mocked (e.g., using `Req`
  in production and a mock in tests). Implementing modules must handle the execution
  of the network request and return a standard `Req.Response` struct or an error tuple.
  """

  @doc "Contract for HTTP request adapters"
  @callback send_request(method :: atom(), url :: String.t(), opts :: keyword()) ::
              {:ok, Req.Response.t()} | {:error, term()}
end
