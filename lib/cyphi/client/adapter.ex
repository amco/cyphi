defmodule Cyphi.Client.Adapter do
  @moduledoc """
  Cypher learning OpenAPI Client Adapter
  """

  alias Cyphi.Client.TransportAdapter

  @type method() :: String.t()
  @type url() :: String.t()
  @type req_opts() :: %{method: method(), url: url(), options: keyword()}

  @spec req(req_opts()) :: term()
  def req(opts) do
    adapter().call(opts)
  end

  defp adapter do
    Application.get_env(:cyphi, :adapter, TransportAdapter)
  end
end
