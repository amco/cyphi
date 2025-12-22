defmodule Cyphi.Webhooks do
  @moduledoc """
  Provides API endpoints related to webhooks
  """

  @default_client Cyphi.Client

  @type webhook_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create webhook

  Create a webhook.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec webhook_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.Webhook.t()}
          | {:error,
             Cyphi.Webhooks.webhook_crud_create_400_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_403_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_404_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_405_json_resp()}
  def webhook_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Webhooks, :webhook_crud_create},
      url: "/webhooks",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Webhook, :t}},
        {400, {Cyphi.Webhooks, :webhook_crud_create_400_json_resp}},
        {403, {Cyphi.Webhooks, :webhook_crud_create_403_json_resp}},
        {404, {Cyphi.Webhooks, :webhook_crud_create_404_json_resp}},
        {405, {Cyphi.Webhooks, :webhook_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type webhook_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type webhook_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create webhooks

  Create one or more webhooks.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec webhook_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Webhooks.webhook_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Webhooks.webhook_crud_create_batch_400_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_batch_403_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_batch_404_json_resp()
             | Cyphi.Webhooks.webhook_crud_create_batch_405_json_resp()}
  def webhook_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Webhooks, :webhook_crud_create_batch},
      url: "/webhooks/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Webhooks, :webhook_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Webhooks, :webhook_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Webhooks, :webhook_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Webhooks, :webhook_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Webhooks, :webhook_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type webhook_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete a webhook

  Delete a webhook.
  """
  @spec webhook_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Webhooks.webhook_crud_delete_400_json_resp()
             | Cyphi.Webhooks.webhook_crud_delete_403_json_resp()
             | Cyphi.Webhooks.webhook_crud_delete_404_json_resp()
             | Cyphi.Webhooks.webhook_crud_delete_405_json_resp()}
  def webhook_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Webhooks, :webhook_crud_delete},
      url: "/webhooks/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Webhooks, :webhook_crud_delete_400_json_resp}},
        {403, {Cyphi.Webhooks, :webhook_crud_delete_403_json_resp}},
        {404, {Cyphi.Webhooks, :webhook_crud_delete_404_json_resp}},
        {405, {Cyphi.Webhooks, :webhook_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type webhook_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a webhook

  Return a webhook.
  """
  @spec webhook_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Webhook.t()}
          | {:error,
             Cyphi.Webhooks.webhook_crud_get_400_json_resp()
             | Cyphi.Webhooks.webhook_crud_get_403_json_resp()
             | Cyphi.Webhooks.webhook_crud_get_404_json_resp()
             | Cyphi.Webhooks.webhook_crud_get_405_json_resp()}
  def webhook_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Webhooks, :webhook_crud_get},
      url: "/webhooks/#{id}",
      method: :get,
      response: [
        {200, {Cyphi.Webhook, :t}},
        {400, {Cyphi.Webhooks, :webhook_crud_get_400_json_resp}},
        {403, {Cyphi.Webhooks, :webhook_crud_get_403_json_resp}},
        {404, {Cyphi.Webhooks, :webhook_crud_get_404_json_resp}},
        {405, {Cyphi.Webhooks, :webhook_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type webhook_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type webhook_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List webhooks

  Return a list of webhooks.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, target_url, event.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec webhook_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Webhook.t()]}
          | {:error,
             Cyphi.Webhooks.webhook_crud_list_400_json_resp()
             | Cyphi.Webhooks.webhook_crud_list_403_json_resp()
             | Cyphi.Webhooks.webhook_crud_list_404_json_resp()
             | Cyphi.Webhooks.webhook_crud_list_405_json_resp()}
  def webhook_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [],
      call: {Cyphi.Webhooks, :webhook_crud_list},
      url: "/webhooks",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Webhook, :t}]},
        {400, {Cyphi.Webhooks, :webhook_crud_list_400_json_resp}},
        {403, {Cyphi.Webhooks, :webhook_crud_list_403_json_resp}},
        {404, {Cyphi.Webhooks, :webhook_crud_list_404_json_resp}},
        {405, {Cyphi.Webhooks, :webhook_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:webhook_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:webhook_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:webhook_crud_list_405_json_resp) do
    [message: :string]
  end
end
