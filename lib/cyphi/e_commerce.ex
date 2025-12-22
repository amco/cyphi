defmodule Cyphi.ECommerce do
  @moduledoc """
  Provides API endpoints related to e commerce
  """

  @default_client Cyphi.Client

  @type order_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type order_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type order_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type order_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get order

  <p>
    Return the order with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, organization, verifier.

  """
  @spec order_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Order.t()}
          | {:error,
             Cyphi.ECommerce.order_crud_get_400_json_resp()
             | Cyphi.ECommerce.order_crud_get_403_json_resp()
             | Cyphi.ECommerce.order_crud_get_404_json_resp()
             | Cyphi.ECommerce.order_crud_get_405_json_resp()}
  def order_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.ECommerce, :order_crud_get},
      url: "/orders/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Order, :t}},
        {400, {Cyphi.ECommerce, :order_crud_get_400_json_resp}},
        {403, {Cyphi.ECommerce, :order_crud_get_403_json_resp}},
        {404, {Cyphi.ECommerce, :order_crud_get_404_json_resp}},
        {405, {Cyphi.ECommerce, :order_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type order_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type order_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type order_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type order_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List orders

  Return a list of orders.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, organization_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, organization, verifier.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: user_id, organization_id, id. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec order_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Order.t()]}
          | {:error,
             Cyphi.ECommerce.order_crud_list_400_json_resp()
             | Cyphi.ECommerce.order_crud_list_403_json_resp()
             | Cyphi.ECommerce.order_crud_list_404_json_resp()
             | Cyphi.ECommerce.order_crud_list_405_json_resp()}
  def order_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"$after",
        :"$count",
        :"$filter",
        :"$include",
        :"$limit",
        :"$offset",
        :"$order"
      ])

    client.request(%{
      args: [],
      call: {Cyphi.ECommerce, :order_crud_list},
      url: "/orders",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Order, :t}]},
        {400, {Cyphi.ECommerce, :order_crud_list_400_json_resp}},
        {403, {Cyphi.ECommerce, :order_crud_list_403_json_resp}},
        {404, {Cyphi.ECommerce, :order_crud_list_404_json_resp}},
        {405, {Cyphi.ECommerce, :order_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:order_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:order_crud_list_405_json_resp) do
    [message: :string]
  end
end
