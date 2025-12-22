defmodule Cyphi.Groups do
  @moduledoc """
  Provides API endpoints related to groups
  """

  @default_client Cyphi.Client

  @type group_admin_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group admin

  <p>
    Add a group admin.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_admin_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_admin_crud_create_400_json_resp()
             | Cyphi.Groups.group_admin_crud_create_403_json_resp()
             | Cyphi.Groups.group_admin_crud_create_404_json_resp()
             | Cyphi.Groups.group_admin_crud_create_405_json_resp()}
  def group_admin_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_admin_crud_create},
      url: "/groups/#{id}/admins",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_admin_crud_create_400_json_resp}},
        {403, {Cyphi.Groups, :group_admin_crud_create_403_json_resp}},
        {404, {Cyphi.Groups, :group_admin_crud_create_404_json_resp}},
        {405, {Cyphi.Groups, :group_admin_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_admin_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_admin_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group admins

  <p>
    Add up to 100 group admins using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_admin_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_admin_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_admin_crud_create_batch_400_json_resp()
             | Cyphi.Groups.group_admin_crud_create_batch_403_json_resp()
             | Cyphi.Groups.group_admin_crud_create_batch_404_json_resp()
             | Cyphi.Groups.group_admin_crud_create_batch_405_json_resp()}
  def group_admin_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_admin_crud_create_batch},
      url: "/groups/#{id}/admins/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_admin_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_admin_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_admin_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_admin_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_admin_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_admin_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove group admin

  <p>
    Remove the specified admin from the group.
  </p>
  """
  @spec group_admin_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Groups.group_admin_crud_delete_400_json_resp()
             | Cyphi.Groups.group_admin_crud_delete_403_json_resp()
             | Cyphi.Groups.group_admin_crud_delete_404_json_resp()
             | Cyphi.Groups.group_admin_crud_delete_405_json_resp()}
  def group_admin_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_admin_crud_delete},
      url: "/groups/#{id}/admins/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Groups, :group_admin_crud_delete_400_json_resp}},
        {403, {Cyphi.Groups, :group_admin_crud_delete_403_json_resp}},
        {404, {Cyphi.Groups, :group_admin_crud_delete_404_json_resp}},
        {405, {Cyphi.Groups, :group_admin_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_admin_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get group admin

  <p>
    Return the admin with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.

  """
  @spec group_admin_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_admin_crud_get_400_json_resp()
             | Cyphi.Groups.group_admin_crud_get_403_json_resp()
             | Cyphi.Groups.group_admin_crud_get_404_json_resp()
             | Cyphi.Groups.group_admin_crud_get_405_json_resp()}
  def group_admin_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_admin_crud_get},
      url: "/groups/#{id}/admins/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_admin_crud_get_400_json_resp}},
        {403, {Cyphi.Groups, :group_admin_crud_get_403_json_resp}},
        {404, {Cyphi.Groups, :group_admin_crud_get_404_json_resp}},
        {405, {Cyphi.Groups, :group_admin_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_admin_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type group_admin_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List group admins

  <p>
    Return a list of the group admins.
    Note that this does not return user objects, it returns their membership records that include the user_id.
    You can use $include=user if you want to get the user object as well.
    Membership records are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec group_admin_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Groups.group_admin_crud_list_400_json_resp()
             | Cyphi.Groups.group_admin_crud_list_403_json_resp()
             | Cyphi.Groups.group_admin_crud_list_404_json_resp()
             | Cyphi.Groups.group_admin_crud_list_405_json_resp()}
  def group_admin_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_admin_crud_list},
      url: "/groups/#{id}/admins",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Groups, :group_admin_crud_list_400_json_resp}},
        {403, {Cyphi.Groups, :group_admin_crud_list_403_json_resp}},
        {404, {Cyphi.Groups, :group_admin_crud_list_404_json_resp}},
        {405, {Cyphi.Groups, :group_admin_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_assistant_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group assistant

  <p>
    Add a group assistant.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_assistant_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_assistant_crud_create_400_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_403_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_404_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_405_json_resp()}
  def group_assistant_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_assistant_crud_create},
      url: "/groups/#{id}/assistants",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_assistant_crud_create_400_json_resp}},
        {403, {Cyphi.Groups, :group_assistant_crud_create_403_json_resp}},
        {404, {Cyphi.Groups, :group_assistant_crud_create_404_json_resp}},
        {405, {Cyphi.Groups, :group_assistant_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_assistant_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_assistant_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group assistants

  <p>
    Add up to 100 group assistants using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_assistant_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_assistant_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_assistant_crud_create_batch_400_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_batch_403_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_batch_404_json_resp()
             | Cyphi.Groups.group_assistant_crud_create_batch_405_json_resp()}
  def group_assistant_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_assistant_crud_create_batch},
      url: "/groups/#{id}/assistants/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_assistant_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_assistant_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_assistant_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_assistant_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_assistant_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_assistant_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove group assistant

  <p>
    Remove the specified assistant from the group.
  </p>
  """
  @spec group_assistant_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Groups.group_assistant_crud_delete_400_json_resp()
             | Cyphi.Groups.group_assistant_crud_delete_403_json_resp()
             | Cyphi.Groups.group_assistant_crud_delete_404_json_resp()
             | Cyphi.Groups.group_assistant_crud_delete_405_json_resp()}
  def group_assistant_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_assistant_crud_delete},
      url: "/groups/#{id}/assistants/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Groups, :group_assistant_crud_delete_400_json_resp}},
        {403, {Cyphi.Groups, :group_assistant_crud_delete_403_json_resp}},
        {404, {Cyphi.Groups, :group_assistant_crud_delete_404_json_resp}},
        {405, {Cyphi.Groups, :group_assistant_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_assistant_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get group assistant

  <p>
    Return the assistant with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.

  """
  @spec group_assistant_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_assistant_crud_get_400_json_resp()
             | Cyphi.Groups.group_assistant_crud_get_403_json_resp()
             | Cyphi.Groups.group_assistant_crud_get_404_json_resp()
             | Cyphi.Groups.group_assistant_crud_get_405_json_resp()}
  def group_assistant_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_assistant_crud_get},
      url: "/groups/#{id}/assistants/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_assistant_crud_get_400_json_resp}},
        {403, {Cyphi.Groups, :group_assistant_crud_get_403_json_resp}},
        {404, {Cyphi.Groups, :group_assistant_crud_get_404_json_resp}},
        {405, {Cyphi.Groups, :group_assistant_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_assistant_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type group_assistant_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List group assistants

  <p>
    Return a list of the group assistants.
    Note that this does not return user objects, it returns their membership records that include the user_id.
    You can use $include=user if you want to get the user object as well.
    Membership records are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec group_assistant_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Groups.group_assistant_crud_list_400_json_resp()
             | Cyphi.Groups.group_assistant_crud_list_403_json_resp()
             | Cyphi.Groups.group_assistant_crud_list_404_json_resp()
             | Cyphi.Groups.group_assistant_crud_list_405_json_resp()}
  def group_assistant_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_assistant_crud_list},
      url: "/groups/#{id}/assistants",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Groups, :group_assistant_crud_list_400_json_resp}},
        {403, {Cyphi.Groups, :group_assistant_crud_list_403_json_resp}},
        {404, {Cyphi.Groups, :group_assistant_crud_list_404_json_resp}},
        {405, {Cyphi.Groups, :group_assistant_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create group

  Create a group.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.Group.t()}
          | {:error,
             Cyphi.Groups.group_crud_create_400_json_resp()
             | Cyphi.Groups.group_crud_create_403_json_resp()
             | Cyphi.Groups.group_crud_create_404_json_resp()
             | Cyphi.Groups.group_crud_create_405_json_resp()}
  def group_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Groups, :group_crud_create},
      url: "/groups",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Group, :t}},
        {400, {Cyphi.Groups, :group_crud_create_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_create_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_create_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create groups

  <p>
    Create up to 50 groups using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_crud_create_batch_400_json_resp()
             | Cyphi.Groups.group_crud_create_batch_403_json_resp()
             | Cyphi.Groups.group_crud_create_batch_404_json_resp()
             | Cyphi.Groups.group_crud_create_batch_405_json_resp()}
  def group_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Groups, :group_crud_create_batch},
      url: "/groups/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete group

  <p>
    Delete the group with the specified ID.
  </p>
  """
  @spec group_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Groups.group_crud_delete_400_json_resp()
             | Cyphi.Groups.group_crud_delete_403_json_resp()
             | Cyphi.Groups.group_crud_delete_404_json_resp()
             | Cyphi.Groups.group_crud_delete_405_json_resp()}
  def group_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_crud_delete},
      url: "/groups/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Groups, :group_crud_delete_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_delete_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_delete_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get group

  <p>
    Return the group with the specified ID.
  </p>
  """
  @spec group_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Group.t()}
          | {:error,
             Cyphi.Groups.group_crud_get_400_json_resp()
             | Cyphi.Groups.group_crud_get_403_json_resp()
             | Cyphi.Groups.group_crud_get_404_json_resp()
             | Cyphi.Groups.group_crud_get_405_json_resp()}
  def group_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_crud_get},
      url: "/groups/#{id}",
      method: :get,
      response: [
        {200, {Cyphi.Group, :t}},
        {400, {Cyphi.Groups, :group_crud_get_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_get_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_get_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List groups

  <p>
    Return a list of groups. You can provide one or more optional filters. Currently this operation only returns groups
    that are are scoped to a school/business or to an organization; future versions may include a way to specify
    the specific scope to search within.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, visibility, tags, container_type, metadata.creator_id, metadata.created_at, metadata.language.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec group_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Group.t()]}
          | {:error,
             Cyphi.Groups.group_crud_list_400_json_resp()
             | Cyphi.Groups.group_crud_list_403_json_resp()
             | Cyphi.Groups.group_crud_list_404_json_resp()
             | Cyphi.Groups.group_crud_list_405_json_resp()}
  def group_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [],
      call: {Cyphi.Groups, :group_crud_list},
      url: "/groups",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Group, :t}]},
        {400, {Cyphi.Groups, :group_crud_list_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_list_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_list_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update group

  <p>
    Update the group with the specified ID.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Group.t()}
          | {:error,
             Cyphi.Groups.group_crud_update_400_json_resp()
             | Cyphi.Groups.group_crud_update_403_json_resp()
             | Cyphi.Groups.group_crud_update_404_json_resp()
             | Cyphi.Groups.group_crud_update_405_json_resp()}
  def group_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_crud_update},
      url: "/groups/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.Group, :t}},
        {400, {Cyphi.Groups, :group_crud_update_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_update_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_update_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update groups

  <p>
    Update up to 50 groups using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_crud_update_batch_400_json_resp()
             | Cyphi.Groups.group_crud_update_batch_403_json_resp()
             | Cyphi.Groups.group_crud_update_batch_404_json_resp()
             | Cyphi.Groups.group_crud_update_batch_405_json_resp()}
  def group_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Groups, :group_crud_update_batch},
      url: "/groups/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_leader_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group leader

  <p>
    Add a group leader.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_leader_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_leader_crud_create_400_json_resp()
             | Cyphi.Groups.group_leader_crud_create_403_json_resp()
             | Cyphi.Groups.group_leader_crud_create_404_json_resp()
             | Cyphi.Groups.group_leader_crud_create_405_json_resp()}
  def group_leader_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_leader_crud_create},
      url: "/groups/#{id}/leaders",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_leader_crud_create_400_json_resp}},
        {403, {Cyphi.Groups, :group_leader_crud_create_403_json_resp}},
        {404, {Cyphi.Groups, :group_leader_crud_create_404_json_resp}},
        {405, {Cyphi.Groups, :group_leader_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_leader_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_leader_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group leaders

  <p>
    Add up to 100 group leaders using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_leader_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_leader_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_leader_crud_create_batch_400_json_resp()
             | Cyphi.Groups.group_leader_crud_create_batch_403_json_resp()
             | Cyphi.Groups.group_leader_crud_create_batch_404_json_resp()
             | Cyphi.Groups.group_leader_crud_create_batch_405_json_resp()}
  def group_leader_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_leader_crud_create_batch},
      url: "/groups/#{id}/leaders/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_leader_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_leader_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_leader_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_leader_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_leader_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_leader_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove group leader

  <p>
    Remove the specified leader from the group.
  </p>
  """
  @spec group_leader_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Groups.group_leader_crud_delete_400_json_resp()
             | Cyphi.Groups.group_leader_crud_delete_403_json_resp()
             | Cyphi.Groups.group_leader_crud_delete_404_json_resp()
             | Cyphi.Groups.group_leader_crud_delete_405_json_resp()}
  def group_leader_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_leader_crud_delete},
      url: "/groups/#{id}/leaders/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Groups, :group_leader_crud_delete_400_json_resp}},
        {403, {Cyphi.Groups, :group_leader_crud_delete_403_json_resp}},
        {404, {Cyphi.Groups, :group_leader_crud_delete_404_json_resp}},
        {405, {Cyphi.Groups, :group_leader_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_leader_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get group leader

  <p>
    Return the leader with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.

  """
  @spec group_leader_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_leader_crud_get_400_json_resp()
             | Cyphi.Groups.group_leader_crud_get_403_json_resp()
             | Cyphi.Groups.group_leader_crud_get_404_json_resp()
             | Cyphi.Groups.group_leader_crud_get_405_json_resp()}
  def group_leader_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_leader_crud_get},
      url: "/groups/#{id}/leaders/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_leader_crud_get_400_json_resp}},
        {403, {Cyphi.Groups, :group_leader_crud_get_403_json_resp}},
        {404, {Cyphi.Groups, :group_leader_crud_get_404_json_resp}},
        {405, {Cyphi.Groups, :group_leader_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_leader_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type group_leader_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List group leaders

  <p>
    Return a list of the group leaders.
    Note that this does not return user objects, it returns their membership records that include the user_id.
    You can use $include=user if you want to get the user object as well.
    Membership records are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec group_leader_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Groups.group_leader_crud_list_400_json_resp()
             | Cyphi.Groups.group_leader_crud_list_403_json_resp()
             | Cyphi.Groups.group_leader_crud_list_404_json_resp()
             | Cyphi.Groups.group_leader_crud_list_405_json_resp()}
  def group_leader_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_leader_crud_list},
      url: "/groups/#{id}/leaders",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Groups, :group_leader_crud_list_400_json_resp}},
        {403, {Cyphi.Groups, :group_leader_crud_list_403_json_resp}},
        {404, {Cyphi.Groups, :group_leader_crud_list_404_json_resp}},
        {405, {Cyphi.Groups, :group_leader_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_member_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group member

  <p>
    Add a group member.
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_member_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_member_crud_create_400_json_resp()
             | Cyphi.Groups.group_member_crud_create_403_json_resp()
             | Cyphi.Groups.group_member_crud_create_404_json_resp()
             | Cyphi.Groups.group_member_crud_create_405_json_resp()}
  def group_member_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_member_crud_create},
      url: "/groups/#{id}/members",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_member_crud_create_400_json_resp}},
        {403, {Cyphi.Groups, :group_member_crud_create_403_json_resp}},
        {404, {Cyphi.Groups, :group_member_crud_create_404_json_resp}},
        {405, {Cyphi.Groups, :group_member_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_member_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type group_member_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add group members

  <p>
    Add up to 100 group members using a batch job.
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec group_member_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Groups.group_member_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Groups.group_member_crud_create_batch_400_json_resp()
             | Cyphi.Groups.group_member_crud_create_batch_403_json_resp()
             | Cyphi.Groups.group_member_crud_create_batch_404_json_resp()
             | Cyphi.Groups.group_member_crud_create_batch_405_json_resp()}
  def group_member_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Groups, :group_member_crud_create_batch},
      url: "/groups/#{id}/members/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Groups, :group_member_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Groups, :group_member_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Groups, :group_member_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Groups, :group_member_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Groups, :group_member_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_member_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove group member

  <p>
    Remove the specified member from the group.
  </p>
  """
  @spec group_member_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Groups.group_member_crud_delete_400_json_resp()
             | Cyphi.Groups.group_member_crud_delete_403_json_resp()
             | Cyphi.Groups.group_member_crud_delete_404_json_resp()
             | Cyphi.Groups.group_member_crud_delete_405_json_resp()}
  def group_member_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_member_crud_delete},
      url: "/groups/#{id}/members/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Groups, :group_member_crud_delete_400_json_resp}},
        {403, {Cyphi.Groups, :group_member_crud_delete_403_json_resp}},
        {404, {Cyphi.Groups, :group_member_crud_delete_404_json_resp}},
        {405, {Cyphi.Groups, :group_member_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_member_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get group member

  <p>
    Return the member with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.

  """
  @spec group_member_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.GroupMembership.t()}
          | {:error,
             Cyphi.Groups.group_member_crud_get_400_json_resp()
             | Cyphi.Groups.group_member_crud_get_403_json_resp()
             | Cyphi.Groups.group_member_crud_get_404_json_resp()
             | Cyphi.Groups.group_member_crud_get_405_json_resp()}
  def group_member_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Groups, :group_member_crud_get},
      url: "/groups/#{id}/members/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.GroupMembership, :t}},
        {400, {Cyphi.Groups, :group_member_crud_get_400_json_resp}},
        {403, {Cyphi.Groups, :group_member_crud_get_403_json_resp}},
        {404, {Cyphi.Groups, :group_member_crud_get_404_json_resp}},
        {405, {Cyphi.Groups, :group_member_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type group_member_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type group_member_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List group members

  <p>
    Return a list of the group members.
    Note that this does not return user objects, it returns their membership records that include the user_id.
    You can use $include=user if you want to get the user object as well.
    Membership records are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec group_member_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Groups.group_member_crud_list_400_json_resp()
             | Cyphi.Groups.group_member_crud_list_403_json_resp()
             | Cyphi.Groups.group_member_crud_list_404_json_resp()
             | Cyphi.Groups.group_member_crud_list_405_json_resp()}
  def group_member_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Groups, :group_member_crud_list},
      url: "/groups/#{id}/members",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Groups, :group_member_crud_list_400_json_resp}},
        {403, {Cyphi.Groups, :group_member_crud_list_403_json_resp}},
        {404, {Cyphi.Groups, :group_member_crud_list_404_json_resp}},
        {405, {Cyphi.Groups, :group_member_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:group_admin_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_admin_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_admin_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_assistant_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_assistant_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_leader_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_leader_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:group_member_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:group_member_crud_list_405_json_resp) do
    [message: :string]
  end
end
