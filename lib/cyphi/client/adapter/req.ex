defmodule Cyphi.HttpAdapter.Req do
  @moduledoc false

  @behaviour Cyphi.HttpAdapter

  @impl true
  def send_request(method, url, opts) do
    apply(Req, method, [url, opts])
  end
end
