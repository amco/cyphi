defmodule Cyphi.Batches do
  @moduledoc """
  Provides API endpoints related to batches
  """

  @default_client Cyphi.Client

  @type batch_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type batch_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type batch_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type batch_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get batch

  <p>
    Return the batch with the specified ID. A batch represents a batch operation, and the status of a batch can be
    "Queued" (waiting to be run), "Running" (currently being processed), and "Finished" (finished processing).
    When you run an operation in batch mode, it returns the ID of its batch which you can then fetch with a GET to
    poll for its status and obtain the results of the operation once it has completed.
  </p>

  <p>
    Note that "Finished" does not necessarily mean that the operation was successful. You should check the status
    of the structures in the response_bodies attribute to see the status of each individual operation.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.

  """
  @spec batch_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Batch.t()}
          | {:error,
             Cyphi.Batches.batch_crud_get_400_json_resp()
             | Cyphi.Batches.batch_crud_get_403_json_resp()
             | Cyphi.Batches.batch_crud_get_404_json_resp()
             | Cyphi.Batches.batch_crud_get_405_json_resp()}
  def batch_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Batches, :batch_crud_get},
      url: "/batches/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Batch, :t}},
        {400, {Cyphi.Batches, :batch_crud_get_400_json_resp}},
        {403, {Cyphi.Batches, :batch_crud_get_403_json_resp}},
        {404, {Cyphi.Batches, :batch_crud_get_404_json_resp}},
        {405, {Cyphi.Batches, :batch_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type batch_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type batch_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type batch_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type batch_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List batches

  <p>
    Return a list of batches. Each batch object represents a batch operation. The status of a batch
    can be "Queued" (waiting to be run), "Running" (currently being processed), and "Finished" (finished processing).
    When you run an operation in batch mode, it returns the ID of its batch which you can then fetch with a GET
    to poll for its status and obtain the results of the operation once it has completed.
  </p>

  <p>
    Note that "Finished" does not necessarily mean that the operation was successful. You should check the status
    of the structures in the response_bodies attribute to see the status of each individual operation.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, user_id, status.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec batch_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Batch.t()]}
          | {:error,
             Cyphi.Batches.batch_crud_list_400_json_resp()
             | Cyphi.Batches.batch_crud_list_403_json_resp()
             | Cyphi.Batches.batch_crud_list_404_json_resp()
             | Cyphi.Batches.batch_crud_list_405_json_resp()}
  def batch_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [],
      call: {Cyphi.Batches, :batch_crud_list},
      url: "/batches",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Batch, :t}]},
        {400, {Cyphi.Batches, :batch_crud_list_400_json_resp}},
        {403, {Cyphi.Batches, :batch_crud_list_403_json_resp}},
        {404, {Cyphi.Batches, :batch_crud_list_404_json_resp}},
        {405, {Cyphi.Batches, :batch_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:batch_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:batch_crud_list_405_json_resp) do
    [message: :string]
  end
end
