defmodule Cyphi.Organizations do
  @moduledoc """
  Provides API endpoints related to organizations
  """

  @default_client Cyphi.Client

  @type organization_course_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_course_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_course_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_course_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List organization courses

  <p>
    Return a list of the courses in the specified organization. By default, it lists courses that are not archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: archived (default: false), organization_id, id, name, course_code, sis_id, sis_pid, path, tags, metadata.creator_id, metadata.created_at, metadata.language.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent, current_module, organization.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec organization_course_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Course.t()]}
          | {:error,
             Cyphi.Organizations.organization_course_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_course_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_course_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_course_crud_list_405_json_resp()}
  def organization_course_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Organizations, :organization_course_crud_list},
      url: "/organizations/#{id}/courses",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Course, :t}]},
        {400, {Cyphi.Organizations, :organization_course_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_course_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_course_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_course_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_course_template_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_course_template_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_course_template_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_course_template_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List organization course templates

  <p>
    Return a list of the course templates in the specified organization.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: organization_id, id, name, course_code, sis_id, sis_pid, path, tags, metadata.creator_id, metadata.created_at, metadata.language.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: organization.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec organization_course_template_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.CourseTemplate.t()]}
          | {:error,
             Cyphi.Organizations.organization_course_template_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_course_template_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_course_template_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_course_template_crud_list_405_json_resp()}
  def organization_course_template_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Organizations, :organization_course_template_crud_list},
      url: "/organizations/#{id}/course_templates",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.CourseTemplate, :t}]},
        {400, {Cyphi.Organizations, :organization_course_template_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_course_template_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_course_template_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_course_template_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create organization

  <p>
    Create an organization.
  </p>

  <p>
    An optional position=setting option may be used to specify the location of the new organization. Here are
    the available options for the setting, and if a position is not specified, it is AtEnd by default:
  </p>

  <dl>
    <dt>AtStart</dt>
    <dd>Added as the first organization</dd>

    <dt>AtEnd</dt>
    <dd>Added as the last organization</dd>

    <dt>AfterOrg:ID</dt>
    <dd>Added after the organization with the specified ID</dd>

    <dt>BeforeOrg:ID</dt>
    <dd>Added before the organization with the specified ID</dd>

    <dt>FirstChildOfOrg:ID</dt>
    <dd>Added as the first child of the organization with the specified ID</dd>

    <dt>LastChildOfOrg:ID</dt>
    <dd>Added as the last child of the organization with the specified ID</dd>
  </dl>

  ## Options

    * `$options`: Valid options are: position

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.Organization.t()}
          | {:error,
             Cyphi.Organizations.organization_crud_create_400_json_resp()
             | Cyphi.Organizations.organization_crud_create_403_json_resp()
             | Cyphi.Organizations.organization_crud_create_404_json_resp()
             | Cyphi.Organizations.organization_crud_create_405_json_resp()}
  def organization_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [body: body],
      call: {Cyphi.Organizations, :organization_crud_create},
      url: "/organizations",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Organization, :t}},
        {400, {Cyphi.Organizations, :organization_crud_create_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_create_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_create_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type organization_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create organizations

  <p>
    Create up to 50 organizations using a batch job.
  </p>

  <p>
    An optional position=setting option may be used to specify the location of the new organizations. Here are
    the available options for the setting, and if a position is not specified, it is AtEnd by default:
  </p>

  <dl>
    <dt>AtStart</dt>
    <dd>Added as the first organization</dd>

    <dt>AtEnd</dt>
    <dd>Added as the last organization</dd>

    <dt>AfterOrg:ID</dt>
    <dd>Added after the organization with the specified ID</dd>

    <dt>BeforeOrg:ID</dt>
    <dd>Added before the organization with the specified ID</dd>

    <dt>FirstChildOfOrg:ID</dt>
    <dd>Added as the first child of the organization with the specified ID</dd>

    <dt>LastChildOfOrg:ID</dt>
    <dd>Added as the last child of the organization with the specified ID</dd>
  </dl>

  ## Options

    * `$options`: Valid options are: position

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Organizations.organization_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Organizations.organization_crud_create_batch_400_json_resp()
             | Cyphi.Organizations.organization_crud_create_batch_403_json_resp()
             | Cyphi.Organizations.organization_crud_create_batch_404_json_resp()
             | Cyphi.Organizations.organization_crud_create_batch_405_json_resp()}
  def organization_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [body: body],
      call: {Cyphi.Organizations, :organization_crud_create_batch},
      url: "/organizations/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Organizations, :organization_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Organizations, :organization_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete organization

  <p>
    Delete the organization with the specified ID.
  </p>
  """
  @spec organization_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Organizations.organization_crud_delete_400_json_resp()
             | Cyphi.Organizations.organization_crud_delete_403_json_resp()
             | Cyphi.Organizations.organization_crud_delete_404_json_resp()
             | Cyphi.Organizations.organization_crud_delete_405_json_resp()}
  def organization_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Organizations, :organization_crud_delete},
      url: "/organizations/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Organizations, :organization_crud_delete_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_delete_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_delete_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get organization

  <p>
    Return the organization with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent.

  """
  @spec organization_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Organization.t()}
          | {:error,
             Cyphi.Organizations.organization_crud_get_400_json_resp()
             | Cyphi.Organizations.organization_crud_get_403_json_resp()
             | Cyphi.Organizations.organization_crud_get_404_json_resp()
             | Cyphi.Organizations.organization_crud_get_405_json_resp()}
  def organization_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Organizations, :organization_crud_get},
      url: "/organizations/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Organization, :t}},
        {400, {Cyphi.Organizations, :organization_crud_get_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_get_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_get_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List organizations

  Return a list of organizations.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: tags, parent_id, id, name.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec organization_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Organization.t()]}
          | {:error,
             Cyphi.Organizations.organization_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_crud_list_405_json_resp()}
  def organization_crud_list(opts \\ []) do
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
      call: {Cyphi.Organizations, :organization_crud_list},
      url: "/organizations",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Organization, :t}]},
        {400, {Cyphi.Organizations, :organization_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update organization

  <p>
    Update the organization with the specified ID. Note that if you update the parent_id of an organization,
    the organization is added as the last child of its new parent.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Organization.t()}
          | {:error,
             Cyphi.Organizations.organization_crud_update_400_json_resp()
             | Cyphi.Organizations.organization_crud_update_403_json_resp()
             | Cyphi.Organizations.organization_crud_update_404_json_resp()
             | Cyphi.Organizations.organization_crud_update_405_json_resp()}
  def organization_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Organizations, :organization_crud_update},
      url: "/organizations/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.Organization, :t}},
        {400, {Cyphi.Organizations, :organization_crud_update_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_update_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_update_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type organization_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type organization_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update organizations

  <p>
    Update up to 50 organizations using a batch job. Note that if you update the parent_id of an organization,
    the organization is added as the last child of its new parent.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Organizations.organization_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Organizations.organization_crud_update_batch_400_json_resp()
             | Cyphi.Organizations.organization_crud_update_batch_403_json_resp()
             | Cyphi.Organizations.organization_crud_update_batch_404_json_resp()
             | Cyphi.Organizations.organization_crud_update_batch_405_json_resp()}
  def organization_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Organizations, :organization_crud_update_batch},
      url: "/organizations/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Organizations, :organization_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Organizations, :organization_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_group_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_group_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_group_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_group_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List organization groups

  <p>
    Return a list of the groups in the specified organization.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, visibility, tags, container_type, metadata.creator_id, metadata.created_at, metadata.language.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec organization_group_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Group.t()]}
          | {:error,
             Cyphi.Organizations.organization_group_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_group_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_group_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_group_crud_list_405_json_resp()}
  def organization_group_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Organizations, :organization_group_crud_list},
      url: "/organizations/#{id}/groups",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Group, :t}]},
        {400, {Cyphi.Organizations, :organization_group_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_group_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_group_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_group_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_suborganization_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add suborganization

  <p>
    Create an organization that is a suborganizations of the specified organization.
  </p>

  <p>
    An optional position=setting option may be used to specify the location of the new organization. Here are
    the available options for the setting, and if a position is not specified, it is LastChildOfOrg by default:
  </p>

  <dl>
    <dt>FirstChildOfOrg</dt>
    <dd>Added as the first child of the organization</dd>

    <dt>LastChildOfOrg</dt>
    <dd>Added as the last child of the organization</dd>
  </dl>

  ## Options

    * `$options`: Valid options are: position

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_suborganization_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Organization.t()}
          | {:error,
             Cyphi.Organizations.organization_suborganization_crud_create_400_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_403_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_404_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_405_json_resp()}
  def organization_suborganization_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Organizations, :organization_suborganization_crud_create},
      url: "/organizations/#{id}/suborganizations",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Organization, :t}},
        {400, {Cyphi.Organizations, :organization_suborganization_crud_create_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_suborganization_crud_create_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_suborganization_crud_create_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_suborganization_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_suborganization_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type organization_suborganization_crud_create_batch_400_json_resp :: %{
          message: String.t() | nil
        }

  @type organization_suborganization_crud_create_batch_403_json_resp :: %{
          message: String.t() | nil
        }

  @type organization_suborganization_crud_create_batch_404_json_resp :: %{
          message: String.t() | nil
        }

  @type organization_suborganization_crud_create_batch_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Add suborganizations

  <p>
    Create up to 50 organizations that are suborganizations of the specified organization using a batch job.
  </p>

  <p>
    An optional position=setting option may be used to specify the location of the organizations. Here are
    the available options for the setting, and if a position is not specified, it is LastChildOfOrg by default:
  </p>

  <dl>
    <dt>FirstChildOfOrg</dt>
    <dd>Added as the first child of the organization</dd>

    <dt>LastChildOfOrg</dt>
    <dd>Added as the last child of the organization</dd>
  </dl>

  ## Options

    * `$options`: Valid options are: position

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec organization_suborganization_crud_create_batch(
          id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok,
           Cyphi.Organizations.organization_suborganization_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Organizations.organization_suborganization_crud_create_batch_400_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_batch_403_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_batch_404_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_create_batch_405_json_resp()}
  def organization_suborganization_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Organizations, :organization_suborganization_crud_create_batch},
      url: "/organizations/#{id}/suborganizations/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202,
         {Cyphi.Organizations, :organization_suborganization_crud_create_batch_202_json_resp}},
        {400,
         {Cyphi.Organizations, :organization_suborganization_crud_create_batch_400_json_resp}},
        {403,
         {Cyphi.Organizations, :organization_suborganization_crud_create_batch_403_json_resp}},
        {404,
         {Cyphi.Organizations, :organization_suborganization_crud_create_batch_404_json_resp}},
        {405,
         {Cyphi.Organizations, :organization_suborganization_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_suborganization_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete suborganization

  <p>
    Delete the suborganization with the specified ID.
  </p>
  """
  @spec organization_suborganization_crud_delete(
          id :: integer,
          suborganization_id :: integer,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             Cyphi.Organizations.organization_suborganization_crud_delete_400_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_delete_403_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_delete_404_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_delete_405_json_resp()}
  def organization_suborganization_crud_delete(id, suborganization_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, suborganization_id: suborganization_id],
      call: {Cyphi.Organizations, :organization_suborganization_crud_delete},
      url: "/organizations/#{id}/suborganizations/#{suborganization_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Organizations, :organization_suborganization_crud_delete_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_suborganization_crud_delete_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_suborganization_crud_delete_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_suborganization_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_suborganization_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_suborganization_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List suborganizations

  Return a list of organization suborganizations.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: tags, parent_id, id, name.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec organization_suborganization_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Organization.t()]}
          | {:error,
             Cyphi.Organizations.organization_suborganization_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_suborganization_crud_list_405_json_resp()}
  def organization_suborganization_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Organizations, :organization_suborganization_crud_list},
      url: "/organizations/#{id}/suborganizations",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Organization, :t}]},
        {400, {Cyphi.Organizations, :organization_suborganization_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_suborganization_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_suborganization_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_suborganization_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type organization_user_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type organization_user_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type organization_user_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type organization_user_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List organization users

  <p>
    Return a list of the users in the specified organization. By default it lists users that are not archived.
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
  @spec organization_user_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Organizations.organization_user_crud_list_400_json_resp()
             | Cyphi.Organizations.organization_user_crud_list_403_json_resp()
             | Cyphi.Organizations.organization_user_crud_list_404_json_resp()
             | Cyphi.Organizations.organization_user_crud_list_405_json_resp()}
  def organization_user_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Organizations, :organization_user_crud_list},
      url: "/organizations/#{id}/users",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Organizations, :organization_user_crud_list_400_json_resp}},
        {403, {Cyphi.Organizations, :organization_user_crud_list_403_json_resp}},
        {404, {Cyphi.Organizations, :organization_user_crud_list_404_json_resp}},
        {405, {Cyphi.Organizations, :organization_user_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:organization_course_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_template_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_template_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_template_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_course_template_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:organization_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:organization_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_group_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_group_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_group_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_group_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:organization_suborganization_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_suborganization_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_user_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_user_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_user_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:organization_user_crud_list_405_json_resp) do
    [message: :string]
  end
end
