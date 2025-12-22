defmodule Cyphi.HttpAdapter do
  @doc "Contract for HTTP request adapters"
  @callback send_request(method :: atom(), url :: String.t(), opts :: keyword()) ::
              {:ok, Req.Response.t()} | {:error, term()}
end
