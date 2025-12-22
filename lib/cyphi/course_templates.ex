defmodule Cyphi.CourseTemplates do
  @moduledoc """
  Provides API endpoints related to course templates
  """

  @default_client Cyphi.Client

  @type course_template_assessment_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course template assessment

  <p>
    Return the assessment with the specified ID.
  </p>
  """
  @spec course_template_assessment_crud_get(
          id :: integer,
          assessment_id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Assessment.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_assessment_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_get_405_json_resp()}
  def course_template_assessment_crud_get(id, assessment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id],
      call: {Cyphi.CourseTemplates, :course_template_assessment_crud_get},
      url: "/course_templates/#{id}/assessments/#{assessment_id}",
      method: :get,
      response: [
        {200, {Cyphi.Assessment, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_assessment_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_assessment_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_assessment_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_assessment_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_assessment_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_assessment_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template assessments

  <p>
    Return a list of the course template's assessments.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, course_id, given, grading.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_template_assessment_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Assessment.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_assessment_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_assessment_crud_list_405_json_resp()}
  def course_template_assessment_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_assessment_crud_list},
      url: "/course_templates/#{id}/assessments",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Assessment, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_assessment_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_assessment_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_assessment_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_assessment_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_child_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_template_child_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course template children

  Create one or more course template children.

  ## Options

    * `$options`: Valid options are: deep_copy

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_child_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.CourseTemplates.course_template_child_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.CourseTemplates.course_template_child_crud_create_batch_400_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_create_batch_403_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_create_batch_404_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_create_batch_405_json_resp()}
  def course_template_child_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.CourseTemplates, :course_template_child_crud_create_batch},
      url: "/course_templates/#{id}/children/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.CourseTemplates, :course_template_child_crud_create_batch_202_json_resp}},
        {400, {Cyphi.CourseTemplates, :course_template_child_crud_create_batch_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_child_crud_create_batch_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_child_crud_create_batch_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_child_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_child_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_child_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template children

  Return a list of course template children.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: archived (default: false), organization_id, id, name, course_code, sis_id, sis_pid, path, tags, metadata.creator_id, metadata.created_at, metadata.language.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent, current_module, organization.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec course_template_child_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Course.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_child_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_child_crud_list_405_json_resp()}
  def course_template_child_crud_list(id, opts \\ []) do
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
      call: {Cyphi.CourseTemplates, :course_template_child_crud_list},
      url: "/course_templates/#{id}/children",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Course, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_child_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_child_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_child_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_child_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_copy_202_json_resp :: %{batch_id: integer | nil}

  @type course_template_copy_400_json_resp :: %{message: String.t() | nil}

  @type course_template_copy_403_json_resp :: %{message: String.t() | nil}

  @type course_template_copy_404_json_resp :: %{message: String.t() | nil}

  @type course_template_copy_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Copy course template

  <p>
    Create one or more copies of the specified course template.
  </p>

  <p>
    Because this operation copies a course, which can take a while, it always operates in batch mode, and
    will return a batch ID that can be used to monitor the progress and get the final result of the operation.
  </p>

  ## Options

    * `$options`: Valid options are: deep_copy

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_copy(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.CourseTemplates.course_template_copy_202_json_resp()}
          | {:error,
             Cyphi.CourseTemplates.course_template_copy_400_json_resp()
             | Cyphi.CourseTemplates.course_template_copy_403_json_resp()
             | Cyphi.CourseTemplates.course_template_copy_404_json_resp()
             | Cyphi.CourseTemplates.course_template_copy_405_json_resp()}
  def course_template_copy(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.CourseTemplates, :course_template_copy},
      url: "/course_templates/#{id}/copy/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.CourseTemplates, :course_template_copy_202_json_resp}},
        {400, {Cyphi.CourseTemplates, :course_template_copy_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_copy_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_copy_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_copy_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create course template

  <p>
    Create a course template.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.CourseTemplate.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_create_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_405_json_resp()}
  def course_template_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.CourseTemplates, :course_template_crud_create},
      url: "/course_templates",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.CourseTemplate, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_crud_create_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_create_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_create_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_template_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create course templates

  <p>
    Create up to 100 course templates using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.CourseTemplates.course_template_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_create_batch_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_batch_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_batch_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_create_batch_405_json_resp()}
  def course_template_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.CourseTemplates, :course_template_crud_create_batch},
      url: "/course_templates/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.CourseTemplates, :course_template_crud_create_batch_202_json_resp}},
        {400, {Cyphi.CourseTemplates, :course_template_crud_create_batch_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_create_batch_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_create_batch_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete course template

  <p>
    Delete the course template with the specified ID. This places the course template into your trash can where it will be
    permanently deleted after 30 days. You can restore it from the trash at anytime before the 30 days are up.
  </p>
  """
  @spec course_template_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_delete_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_delete_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_delete_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_delete_405_json_resp()}
  def course_template_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_crud_delete},
      url: "/course_templates/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.CourseTemplates, :course_template_crud_delete_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_delete_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_delete_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course template

  <p>
    Return the course template with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: organization.

  """
  @spec course_template_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.CourseTemplate.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_get_405_json_resp()}
  def course_template_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_crud_get},
      url: "/course_templates/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.CourseTemplate, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course templates

  <p>
    Return a list of course templates.
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
  @spec course_template_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.CourseTemplate.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_list_405_json_resp()}
  def course_template_crud_list(opts \\ []) do
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
      call: {Cyphi.CourseTemplates, :course_template_crud_list},
      url: "/course_templates",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.CourseTemplate, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update course template

  <p>
    Update the course template with the specified ID.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.CourseTemplate.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_update_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_405_json_resp()}
  def course_template_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.CourseTemplates, :course_template_crud_update},
      url: "/course_templates/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.CourseTemplate, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_crud_update_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_update_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_update_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_template_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_template_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update course templates

  <p>
    Update up to 100 course templates using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.CourseTemplates.course_template_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.CourseTemplates.course_template_crud_update_batch_400_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_batch_403_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_batch_404_json_resp()
             | Cyphi.CourseTemplates.course_template_crud_update_batch_405_json_resp()}
  def course_template_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.CourseTemplates, :course_template_crud_update_batch},
      url: "/course_templates/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.CourseTemplates, :course_template_crud_update_batch_202_json_resp}},
        {400, {Cyphi.CourseTemplates, :course_template_crud_update_batch_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_crud_update_batch_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_crud_update_batch_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_group_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course template's group

  Return a course template's group.
  """
  @spec course_template_group_crud_get(id :: integer, group_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Group.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_group_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_get_405_json_resp()}
  def course_template_group_crud_get(id, group_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, group_id: group_id],
      call: {Cyphi.CourseTemplates, :course_template_group_crud_get},
      url: "/course_templates/#{id}/groups/#{group_id}",
      method: :get,
      response: [
        {200, {Cyphi.Group, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_group_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_group_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_group_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_group_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_group_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_group_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template groups

  Return a list of course template groups.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, visibility, tags, container_type, metadata.creator_id, metadata.created_at, metadata.language.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec course_template_group_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Group.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_group_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_group_crud_list_405_json_resp()}
  def course_template_group_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_group_crud_list},
      url: "/course_templates/#{id}/groups",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Group, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_group_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_group_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_group_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_group_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_instructor_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course template instructor

  <p>
    Add a course instructor.
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_instructor_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Instructor.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_instructor_crud_create_400_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_403_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_404_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_405_json_resp()}
  def course_template_instructor_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.CourseTemplates, :course_template_instructor_crud_create},
      url: "/course_templates/#{id}/instructors",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Instructor, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_instructor_crud_create_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_instructor_crud_create_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_instructor_crud_create_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_instructor_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_instructor_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_template_instructor_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course template instructors

  <p>
    Add up to 100 course instructors using a batch job.
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_template_instructor_crud_create_batch(
          id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok,
           Cyphi.CourseTemplates.course_template_instructor_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.CourseTemplates.course_template_instructor_crud_create_batch_400_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_batch_403_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_batch_404_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_create_batch_405_json_resp()}
  def course_template_instructor_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch},
      url: "/course_templates/#{id}/instructors/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202,
         {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch_202_json_resp}},
        {400,
         {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch_400_json_resp}},
        {403,
         {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch_403_json_resp}},
        {404,
         {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch_404_json_resp}},
        {405,
         {Cyphi.CourseTemplates, :course_template_instructor_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_instructor_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove course template instructor

  <p>
    Remove the specified course instructor.
  </p>
  """
  @spec course_template_instructor_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.CourseTemplates.course_template_instructor_crud_delete_400_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_delete_403_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_delete_404_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_delete_405_json_resp()}
  def course_template_instructor_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.CourseTemplates, :course_template_instructor_crud_delete},
      url: "/course_templates/#{id}/instructors/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.CourseTemplates, :course_template_instructor_crud_delete_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_instructor_crud_delete_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_instructor_crud_delete_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_instructor_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_instructor_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course template instructor

  <p>
    Return the instructor record for the specified user. Note that this does not return the user object, although you
    can use $include=user if you want to get the user object as well
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.

  """
  @spec course_template_instructor_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Instructor.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_instructor_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_get_405_json_resp()}
  def course_template_instructor_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.CourseTemplates, :course_template_instructor_crud_get},
      url: "/course_templates/#{id}/instructors/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Instructor, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_instructor_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_instructor_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_instructor_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_instructor_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_instructor_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_instructor_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template instructors

  <p>
    List the instructors in the course template. Note that this does not return user objects, it returns instructor records
    that include the user_id. You can use $include=user if you want to get the user object as well. It never returns
    instructor records for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, coinstructor.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_template_instructor_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Instructor.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_instructor_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_instructor_crud_list_405_json_resp()}
  def course_template_instructor_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_instructor_crud_list},
      url: "/course_templates/#{id}/instructors",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Instructor, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_instructor_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_instructor_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_instructor_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_instructor_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_module_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course template's module

  Return a course template's module.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: course.

  """
  @spec course_template_module_crud_get(id :: integer, module_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Module.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_module_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_get_405_json_resp()}
  def course_template_module_crud_get(id, module_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, module_id: module_id],
      call: {Cyphi.CourseTemplates, :course_template_module_crud_get},
      url: "/course_templates/#{id}/modules/#{module_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Module, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_module_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_module_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_module_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_module_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_module_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_module_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template modules

  Return a list of course template modules.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, start_at, begin_at, end_at, course_id, tags.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_template_module_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Module.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_module_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_module_crud_list_405_json_resp()}
  def course_template_module_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_module_crud_list},
      url: "/course_templates/#{id}/modules",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Module, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_module_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_module_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_module_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_module_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_section_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a course template's section

  Return a course template's section.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.

  """
  @spec course_template_section_crud_get(id :: integer, section_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Section.t()}
          | {:error,
             Cyphi.CourseTemplates.course_template_section_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_get_405_json_resp()}
  def course_template_section_crud_get(id, section_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, section_id: section_id],
      call: {Cyphi.CourseTemplates, :course_template_section_crud_get},
      url: "/course_templates/#{id}/sections/#{section_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Section, :t}},
        {400, {Cyphi.CourseTemplates, :course_template_section_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_section_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_section_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_section_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_template_section_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_template_section_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course template sections

  Return a list of course template sections.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, type, module_id, referenced_course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_template_section_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Section.t()]}
          | {:error,
             Cyphi.CourseTemplates.course_template_section_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.course_template_section_crud_list_405_json_resp()}
  def course_template_section_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.CourseTemplates, :course_template_section_crud_list},
      url: "/course_templates/#{id}/sections",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Section, :t}]},
        {400, {Cyphi.CourseTemplates, :course_template_section_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :course_template_section_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :course_template_section_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :course_template_section_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type module_section_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a module's section

  Return a module's section.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.

  """
  @spec module_section_crud_get(
          id :: integer,
          module_id :: integer,
          section_id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Section.t()}
          | {:error,
             Cyphi.CourseTemplates.module_section_crud_get_400_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_get_403_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_get_404_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_get_405_json_resp()}
  def module_section_crud_get(id, module_id, section_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, module_id: module_id, section_id: section_id],
      call: {Cyphi.CourseTemplates, :module_section_crud_get},
      url: "/course_templates/#{id}/modules/#{module_id}/sections/#{section_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Section, :t}},
        {400, {Cyphi.CourseTemplates, :module_section_crud_get_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :module_section_crud_get_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :module_section_crud_get_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :module_section_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type module_section_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type module_section_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List module sections

  Return a list of module sections.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, type, module_id, referenced_course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec module_section_crud_list(id :: integer, module_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Section.t()]}
          | {:error,
             Cyphi.CourseTemplates.module_section_crud_list_400_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_list_403_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_list_404_json_resp()
             | Cyphi.CourseTemplates.module_section_crud_list_405_json_resp()}
  def module_section_crud_list(id, module_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, module_id: module_id],
      call: {Cyphi.CourseTemplates, :module_section_crud_list},
      url: "/course_templates/#{id}/modules/#{module_id}/sections",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Section, :t}]},
        {400, {Cyphi.CourseTemplates, :module_section_crud_list_400_json_resp}},
        {403, {Cyphi.CourseTemplates, :module_section_crud_list_403_json_resp}},
        {404, {Cyphi.CourseTemplates, :module_section_crud_list_404_json_resp}},
        {405, {Cyphi.CourseTemplates, :module_section_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:course_template_assessment_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_assessment_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_template_child_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_child_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_copy_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_template_copy_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_copy_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_copy_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_copy_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_template_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_template_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_group_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_template_instructor_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_instructor_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_module_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_template_section_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:module_section_crud_list_405_json_resp) do
    [message: :string]
  end
end
