defmodule Cyphi.HttpAdapter.Test do
  @behaviour Cyphi.HttpAdapter

  @impl true
  def send_request(_method, _url, _opts) do
    {:ok, %Req.Response{status: 200, body: %{}}}
  end
end
