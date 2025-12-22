defmodule Cyphi.JobTitles do
  @moduledoc """
  Provides API endpoints related to job titles
  """

  @default_client Cyphi.Client

  @type job_title_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create job title

  <p>
    Create a job title.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec job_title_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.JobTitle.t()}
          | {:error,
             Cyphi.JobTitles.job_title_crud_create_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_405_json_resp()}
  def job_title_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.JobTitles, :job_title_crud_create},
      url: "/job_titles",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.JobTitle, :t}},
        {400, {Cyphi.JobTitles, :job_title_crud_create_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_create_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_create_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type job_title_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create job titles

  <p>
    Create up to 100 job titles using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec job_title_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.JobTitles.job_title_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.JobTitles.job_title_crud_create_batch_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_batch_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_batch_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_create_batch_405_json_resp()}
  def job_title_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.JobTitles, :job_title_crud_create_batch},
      url: "/job_titles/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.JobTitles, :job_title_crud_create_batch_202_json_resp}},
        {400, {Cyphi.JobTitles, :job_title_crud_create_batch_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_create_batch_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_create_batch_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete job title

  <p>
    Delete the job title with the specified ID.
  </p>
  """
  @spec job_title_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.JobTitles.job_title_crud_delete_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_delete_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_delete_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_delete_405_json_resp()}
  def job_title_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.JobTitles, :job_title_crud_delete},
      url: "/job_titles/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.JobTitles, :job_title_crud_delete_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_delete_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_delete_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get job title

  <p>
    Return the job title with the specified ID.
  </p>
  """
  @spec job_title_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.JobTitle.t()}
          | {:error,
             Cyphi.JobTitles.job_title_crud_get_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_get_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_get_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_get_405_json_resp()}
  def job_title_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.JobTitles, :job_title_crud_get},
      url: "/job_titles/#{id}",
      method: :get,
      response: [
        {200, {Cyphi.JobTitle, :t}},
        {400, {Cyphi.JobTitles, :job_title_crud_get_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_get_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_get_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List job titles

  <p>
    Return a list of job titles. You can provide one or more optional filters.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, tags.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec job_title_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.JobTitle.t()]}
          | {:error,
             Cyphi.JobTitles.job_title_crud_list_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_list_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_list_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_list_405_json_resp()}
  def job_title_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [],
      call: {Cyphi.JobTitles, :job_title_crud_list},
      url: "/job_titles",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.JobTitle, :t}]},
        {400, {Cyphi.JobTitles, :job_title_crud_list_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_list_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_list_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update job title

  <p>
    Update the job title with the specified ID.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec job_title_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.JobTitle.t()}
          | {:error,
             Cyphi.JobTitles.job_title_crud_update_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_405_json_resp()}
  def job_title_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.JobTitles, :job_title_crud_update},
      url: "/job_titles/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.JobTitle, :t}},
        {400, {Cyphi.JobTitles, :job_title_crud_update_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_update_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_update_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type job_title_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type job_title_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update job titles

  <p>
    Update up to 100 job titles using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec job_title_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.JobTitles.job_title_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.JobTitles.job_title_crud_update_batch_400_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_batch_403_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_batch_404_json_resp()
             | Cyphi.JobTitles.job_title_crud_update_batch_405_json_resp()}
  def job_title_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.JobTitles, :job_title_crud_update_batch},
      url: "/job_titles/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.JobTitles, :job_title_crud_update_batch_202_json_resp}},
        {400, {Cyphi.JobTitles, :job_title_crud_update_batch_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_crud_update_batch_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_crud_update_batch_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type job_title_user_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type job_title_user_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type job_title_user_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type job_title_user_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List job title users

  <p>
    List users with the specified job title. By default it lists users that are not archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: organization_id, job_title_id, manager_id, added_by_id, id, userid, first_name, last_name, roles, email, mobile_phone, learnerID, instructorID, joined_at, last_login_at, sis_id, sis_pid, archived (default: false), tags.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: organization, archiver, job_title, manager, added_by.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, userid, first_name, last_name, email, learnerID, instructorID, sis_id, sis_pid. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec job_title_user_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.JobTitles.job_title_user_crud_list_400_json_resp()
             | Cyphi.JobTitles.job_title_user_crud_list_403_json_resp()
             | Cyphi.JobTitles.job_title_user_crud_list_404_json_resp()
             | Cyphi.JobTitles.job_title_user_crud_list_405_json_resp()}
  def job_title_user_crud_list(id, opts \\ []) do
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
      args: [id: id],
      call: {Cyphi.JobTitles, :job_title_user_crud_list},
      url: "/job_titles/#{id}/users",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.JobTitles, :job_title_user_crud_list_400_json_resp}},
        {403, {Cyphi.JobTitles, :job_title_user_crud_list_403_json_resp}},
        {404, {Cyphi.JobTitles, :job_title_user_crud_list_404_json_resp}},
        {405, {Cyphi.JobTitles, :job_title_user_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:job_title_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:job_title_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:job_title_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_user_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_user_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_user_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:job_title_user_crud_list_405_json_resp) do
    [message: :string]
  end
end
