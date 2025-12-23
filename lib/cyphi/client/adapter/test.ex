defmodule Cyphi.HttpAdapter.Test do
  @moduledoc false

  @behaviour Cyphi.HttpAdapter

  @impl true
  def send_request(_method, _url, _opts) do
    case Process.get(:http_response) do
      nil ->
        raise "Missing http response process"

      response when is_map(response) ->
        {:ok, struct(Req.Response, response)}

      response ->
        response
    end
  end
end
