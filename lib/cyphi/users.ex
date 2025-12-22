defmodule Cyphi.Users do
  @moduledoc """
  Provides API endpoints related to users
  """

  @default_client Cyphi.Client

  @type user_assessment_grade_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a user's assessment grade

  Return a user's assessment grade.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, grader, assessment, course.

  """
  @spec user_assessment_grade_crud_get(id :: integer, grade_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Grade.t()}
          | {:error,
             Cyphi.Users.user_assessment_grade_crud_get_400_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_get_403_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_get_404_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_get_405_json_resp()}
  def user_assessment_grade_crud_get(id, grade_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, grade_id: grade_id],
      call: {Cyphi.Users, :user_assessment_grade_crud_get},
      url: "/users/#{id}/assessment_grades/#{grade_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Grade, :t}},
        {400, {Cyphi.Users, :user_assessment_grade_crud_get_400_json_resp}},
        {403, {Cyphi.Users, :user_assessment_grade_crud_get_403_json_resp}},
        {404, {Cyphi.Users, :user_assessment_grade_crud_get_404_json_resp}},
        {405, {Cyphi.Users, :user_assessment_grade_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_assessment_grade_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_assessment_grade_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user assessment grades

  Return a list of user assessment grades.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, id, assessment_id, course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, grader, assessment, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_assessment_grade_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Grade.t()]}
          | {:error,
             Cyphi.Users.user_assessment_grade_crud_list_400_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_list_403_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_list_404_json_resp()
             | Cyphi.Users.user_assessment_grade_crud_list_405_json_resp()}
  def user_assessment_grade_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_assessment_grade_crud_list},
      url: "/users/#{id}/assessment_grades",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Grade, :t}]},
        {400, {Cyphi.Users, :user_assessment_grade_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_assessment_grade_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_assessment_grade_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_assessment_grade_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_child_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user child

  <p>
    Add a child to this user.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_child_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_child_crud_create_400_json_resp()
             | Cyphi.Users.user_child_crud_create_403_json_resp()
             | Cyphi.Users.user_child_crud_create_404_json_resp()
             | Cyphi.Users.user_child_crud_create_405_json_resp()}
  def user_child_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_child_crud_create},
      url: "/users/#{id}/children",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_child_crud_create_400_json_resp}},
        {403, {Cyphi.Users, :user_child_crud_create_403_json_resp}},
        {404, {Cyphi.Users, :user_child_crud_create_404_json_resp}},
        {405, {Cyphi.Users, :user_child_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_child_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type user_child_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user children

  <p>
    Add up to 100 children using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_child_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Users.user_child_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Users.user_child_crud_create_batch_400_json_resp()
             | Cyphi.Users.user_child_crud_create_batch_403_json_resp()
             | Cyphi.Users.user_child_crud_create_batch_404_json_resp()
             | Cyphi.Users.user_child_crud_create_batch_405_json_resp()}
  def user_child_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_child_crud_create_batch},
      url: "/users/#{id}/children/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Users, :user_child_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Users, :user_child_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Users, :user_child_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Users, :user_child_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Users, :user_child_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_child_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove user child

  <p>
    Remove the specified child from the user.
  </p>

  """
  @spec user_child_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Users.user_child_crud_delete_400_json_resp()
             | Cyphi.Users.user_child_crud_delete_403_json_resp()
             | Cyphi.Users.user_child_crud_delete_404_json_resp()
             | Cyphi.Users.user_child_crud_delete_405_json_resp()}
  def user_child_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Users, :user_child_crud_delete},
      url: "/users/#{id}/children/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Users, :user_child_crud_delete_400_json_resp}},
        {403, {Cyphi.Users, :user_child_crud_delete_403_json_resp}},
        {404, {Cyphi.Users, :user_child_crud_delete_404_json_resp}},
        {405, {Cyphi.Users, :user_child_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_child_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_child_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user children

  <p>
    Return a list of the user's children.
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
  @spec user_child_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_child_crud_list_400_json_resp()
             | Cyphi.Users.user_child_crud_list_403_json_resp()
             | Cyphi.Users.user_child_crud_list_404_json_resp()
             | Cyphi.Users.user_child_crud_list_405_json_resp()}
  def user_child_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_child_crud_list},
      url: "/users/#{id}/children",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_child_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_child_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_child_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_child_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_course_assistant_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_course_assistant_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_course_assistant_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_course_assistant_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user course assistants

  Return a list of user course assistants.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_course_assistant_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Assistant.t()]}
          | {:error,
             Cyphi.Users.user_course_assistant_crud_list_400_json_resp()
             | Cyphi.Users.user_course_assistant_crud_list_403_json_resp()
             | Cyphi.Users.user_course_assistant_crud_list_404_json_resp()
             | Cyphi.Users.user_course_assistant_crud_list_405_json_resp()}
  def user_course_assistant_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_course_assistant_crud_list},
      url: "/users/#{id}/course_assistants",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Assistant, :t}]},
        {400, {Cyphi.Users, :user_course_assistant_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_course_assistant_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_course_assistant_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_course_assistant_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_course_instructor_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_course_instructor_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_course_instructor_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_course_instructor_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user course instructors

  Return a list of user course instructors.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, coinstructor.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_course_instructor_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Instructor.t()]}
          | {:error,
             Cyphi.Users.user_course_instructor_crud_list_400_json_resp()
             | Cyphi.Users.user_course_instructor_crud_list_403_json_resp()
             | Cyphi.Users.user_course_instructor_crud_list_404_json_resp()
             | Cyphi.Users.user_course_instructor_crud_list_405_json_resp()}
  def user_course_instructor_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_course_instructor_crud_list},
      url: "/users/#{id}/course_instructors",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Instructor, :t}]},
        {400, {Cyphi.Users, :user_course_instructor_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_course_instructor_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_course_instructor_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_course_instructor_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_course_learner_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_course_learner_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_course_learner_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_course_learner_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user course learners

  Return a list of user course learners.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, enrolled_at, started, started_at, completed, completed_at, completed_by_id, unenrolled (default: false), unenrolled_at, deactivated, deactivated_at, reactivated_at, transferred, transferred_at, course_archived (default: false), user_archived (default: false), last_visited_at.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course, progress, enrolled_by, unenrolled_by, deactivated_by, reactivated_by, transferred_by, transferred_from, transferred_to, order_item.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_course_learner_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Learner.t()]}
          | {:error,
             Cyphi.Users.user_course_learner_crud_list_400_json_resp()
             | Cyphi.Users.user_course_learner_crud_list_403_json_resp()
             | Cyphi.Users.user_course_learner_crud_list_404_json_resp()
             | Cyphi.Users.user_course_learner_crud_list_405_json_resp()}
  def user_course_learner_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_course_learner_crud_list},
      url: "/users/#{id}/course_learners",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Learner, :t}]},
        {400, {Cyphi.Users, :user_course_learner_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_course_learner_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_course_learner_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_course_learner_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create user

  <p>
    Create a user.
  </p>

  <p>
    By default, a user is not notified that an account has been added for them.
    If you want them to receive a notification with login instructions, set the optional send_login_instructions option to true.
    If send_login_instructions is set to true, you can add an additional optional from_name true to send the instructions from that name.

      For example: POST /users?$options={"send_login_instructions": true}, Payload: {first_name: 'John', last_name: 'Smith', userid: 'jsmith', roles: 'Learner'}
  </p>

  ## Options

    * `$options`: Valid options are: send_login_instructions, change_password, from_name, reply_to_email

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_crud_create_400_json_resp()
             | Cyphi.Users.user_crud_create_403_json_resp()
             | Cyphi.Users.user_crud_create_404_json_resp()
             | Cyphi.Users.user_crud_create_405_json_resp()}
  def user_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [body: body],
      call: {Cyphi.Users, :user_crud_create},
      url: "/users",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_crud_create_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_create_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_create_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type user_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create users

  <p>
    Create up to 100 users using a batch job.
  </p>

  <p>
    By default, a user is not notified that an account has been added for them.
    If you want them to receive a notification with login instructions, set the optional send_login_instructions option to true.
    If send_login_instructions is set to true, you can add an additional optional from_name true to send the instructions from that name.

      For example: POST /users?$options={"send_login_instructions": true}, Payload: {first_name: 'John', last_name: 'Smith', userid: 'jsmith', roles: 'Learner'}
  </p>

  ## Options

    * `$options`: Valid options are: send_login_instructions, change_password, from_name, reply_to_email

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Users.user_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Users.user_crud_create_batch_400_json_resp()
             | Cyphi.Users.user_crud_create_batch_403_json_resp()
             | Cyphi.Users.user_crud_create_batch_404_json_resp()
             | Cyphi.Users.user_crud_create_batch_405_json_resp()}
  def user_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [body: body],
      call: {Cyphi.Users, :user_crud_create_batch},
      url: "/users/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Users, :user_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Users, :user_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete user

  <p>
    Delete the user with the specified ID.
  </p>
  """
  @spec user_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Users.user_crud_delete_400_json_resp()
             | Cyphi.Users.user_crud_delete_403_json_resp()
             | Cyphi.Users.user_crud_delete_404_json_resp()
             | Cyphi.Users.user_crud_delete_405_json_resp()}
  def user_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_crud_delete},
      url: "/users/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Users, :user_crud_delete_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_delete_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_delete_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get user

  <p>
    Return the user with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: organization, archiver, job_title, manager, added_by.

  """
  @spec user_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_crud_get_400_json_resp()
             | Cyphi.Users.user_crud_get_403_json_resp()
             | Cyphi.Users.user_crud_get_404_json_resp()
             | Cyphi.Users.user_crud_get_405_json_resp()}
  def user_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_crud_get},
      url: "/users/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_crud_get_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_get_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_get_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List users

  <p>
    Return a list of users. By default, users that are archived are not returned. You can provide one or more optional filters.
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
  @spec user_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_crud_list_400_json_resp()
             | Cyphi.Users.user_crud_list_403_json_resp()
             | Cyphi.Users.user_crud_list_404_json_resp()
             | Cyphi.Users.user_crud_list_405_json_resp()}
  def user_crud_list(opts \\ []) do
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
      call: {Cyphi.Users, :user_crud_list},
      url: "/users",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update user

  <p>
    Update the specified user. Note that to archive/unarchive a user, you can simply update their archived attribute.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_crud_update_400_json_resp()
             | Cyphi.Users.user_crud_update_403_json_resp()
             | Cyphi.Users.user_crud_update_404_json_resp()
             | Cyphi.Users.user_crud_update_405_json_resp()}
  def user_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_crud_update},
      url: "/users/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_crud_update_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_update_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_update_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type user_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type user_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update users

  <p>
    Update up to 100 users using a batch job. Note that to archive/unarchive a user, you can simply update their archived attribute.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Users.user_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Users.user_crud_update_batch_400_json_resp()
             | Cyphi.Users.user_crud_update_batch_403_json_resp()
             | Cyphi.Users.user_crud_update_batch_404_json_resp()
             | Cyphi.Users.user_crud_update_batch_405_json_resp()}
  def user_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Users, :user_crud_update_batch},
      url: "/users/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Users, :user_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Users, :user_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Users, :user_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Users, :user_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Users, :user_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_direct_report_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_direct_report_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_direct_report_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_direct_report_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user direct reports

  Return a list of user direct reports.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: organization_id, job_title_id, manager_id, added_by_id, id, userid, first_name, last_name, roles, email, mobile_phone, learnerID, instructorID, joined_at, last_login_at, sis_id, sis_pid, archived (default: false), tags.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: organization, archiver, job_title, manager, added_by.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, userid, first_name, last_name, email, learnerID, instructorID, sis_id, sis_pid. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec user_direct_report_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_direct_report_crud_list_400_json_resp()
             | Cyphi.Users.user_direct_report_crud_list_403_json_resp()
             | Cyphi.Users.user_direct_report_crud_list_404_json_resp()
             | Cyphi.Users.user_direct_report_crud_list_405_json_resp()}
  def user_direct_report_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_direct_report_crud_list},
      url: "/users/#{id}/direct_reports",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_direct_report_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_direct_report_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_direct_report_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_direct_report_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_friend_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user friend

  <p>
    Add a friend to this user.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_friend_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_friend_crud_create_400_json_resp()
             | Cyphi.Users.user_friend_crud_create_403_json_resp()
             | Cyphi.Users.user_friend_crud_create_404_json_resp()
             | Cyphi.Users.user_friend_crud_create_405_json_resp()}
  def user_friend_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_friend_crud_create},
      url: "/users/#{id}/friends",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_friend_crud_create_400_json_resp}},
        {403, {Cyphi.Users, :user_friend_crud_create_403_json_resp}},
        {404, {Cyphi.Users, :user_friend_crud_create_404_json_resp}},
        {405, {Cyphi.Users, :user_friend_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_friend_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type user_friend_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user friends

  <p>
    Add up to 100 friends using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_friend_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Users.user_friend_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Users.user_friend_crud_create_batch_400_json_resp()
             | Cyphi.Users.user_friend_crud_create_batch_403_json_resp()
             | Cyphi.Users.user_friend_crud_create_batch_404_json_resp()
             | Cyphi.Users.user_friend_crud_create_batch_405_json_resp()}
  def user_friend_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_friend_crud_create_batch},
      url: "/users/#{id}/friends/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Users, :user_friend_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Users, :user_friend_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Users, :user_friend_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Users, :user_friend_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Users, :user_friend_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_friend_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove user friend

  <p>
    Remove the specified friend from the user.
  </p>

  """
  @spec user_friend_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Users.user_friend_crud_delete_400_json_resp()
             | Cyphi.Users.user_friend_crud_delete_403_json_resp()
             | Cyphi.Users.user_friend_crud_delete_404_json_resp()
             | Cyphi.Users.user_friend_crud_delete_405_json_resp()}
  def user_friend_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Users, :user_friend_crud_delete},
      url: "/users/#{id}/friends/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Users, :user_friend_crud_delete_400_json_resp}},
        {403, {Cyphi.Users, :user_friend_crud_delete_403_json_resp}},
        {404, {Cyphi.Users, :user_friend_crud_delete_404_json_resp}},
        {405, {Cyphi.Users, :user_friend_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_friend_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_friend_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user friends

  <p>
    Return a list of the user's friends.
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
  @spec user_friend_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_friend_crud_list_400_json_resp()
             | Cyphi.Users.user_friend_crud_list_403_json_resp()
             | Cyphi.Users.user_friend_crud_list_404_json_resp()
             | Cyphi.Users.user_friend_crud_list_405_json_resp()}
  def user_friend_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_friend_crud_list},
      url: "/users/#{id}/friends",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_friend_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_friend_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_friend_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_friend_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_group_admin_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_group_admin_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_group_admin_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_group_admin_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user group admins

  <p>
    Return Group Membership objects for each group in which this user is an admin.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_group_admin_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Users.user_group_admin_crud_list_400_json_resp()
             | Cyphi.Users.user_group_admin_crud_list_403_json_resp()
             | Cyphi.Users.user_group_admin_crud_list_404_json_resp()
             | Cyphi.Users.user_group_admin_crud_list_405_json_resp()}
  def user_group_admin_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_group_admin_crud_list},
      url: "/users/#{id}/group_admins",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Users, :user_group_admin_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_group_admin_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_group_admin_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_group_admin_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_group_assistant_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_group_assistant_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_group_assistant_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_group_assistant_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user group assistants

  <p>
    Return Group Membership objects for each group in which this user is an assistant.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_group_assistant_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Users.user_group_assistant_crud_list_400_json_resp()
             | Cyphi.Users.user_group_assistant_crud_list_403_json_resp()
             | Cyphi.Users.user_group_assistant_crud_list_404_json_resp()
             | Cyphi.Users.user_group_assistant_crud_list_405_json_resp()}
  def user_group_assistant_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_group_assistant_crud_list},
      url: "/users/#{id}/group_assistants",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Users, :user_group_assistant_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_group_assistant_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_group_assistant_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_group_assistant_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_group_leader_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_group_leader_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_group_leader_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_group_leader_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user group leaders

  <p>
    Return Group Membership objects for each group in which this user is a leader.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_group_leader_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Users.user_group_leader_crud_list_400_json_resp()
             | Cyphi.Users.user_group_leader_crud_list_403_json_resp()
             | Cyphi.Users.user_group_leader_crud_list_404_json_resp()
             | Cyphi.Users.user_group_leader_crud_list_405_json_resp()}
  def user_group_leader_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_group_leader_crud_list},
      url: "/users/#{id}/group_leaders",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Users, :user_group_leader_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_group_leader_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_group_leader_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_group_leader_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_group_member_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_group_member_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_group_member_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_group_member_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user group members

  <p>
    Return Group Membership objects for each group in which this user is a member.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, group_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, group.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_group_member_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.GroupMembership.t()]}
          | {:error,
             Cyphi.Users.user_group_member_crud_list_400_json_resp()
             | Cyphi.Users.user_group_member_crud_list_403_json_resp()
             | Cyphi.Users.user_group_member_crud_list_404_json_resp()
             | Cyphi.Users.user_group_member_crud_list_405_json_resp()}
  def user_group_member_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_group_member_crud_list},
      url: "/users/#{id}/group_members",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.GroupMembership, :t}]},
        {400, {Cyphi.Users, :user_group_member_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_group_member_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_group_member_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_group_member_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_mentee_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_mentee_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_mentee_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_mentee_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user mentees

  <p>
    Return a list of the users that are mentored by this user.
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
  @spec user_mentee_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_mentee_crud_list_400_json_resp()
             | Cyphi.Users.user_mentee_crud_list_403_json_resp()
             | Cyphi.Users.user_mentee_crud_list_404_json_resp()
             | Cyphi.Users.user_mentee_crud_list_405_json_resp()}
  def user_mentee_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_mentee_crud_list},
      url: "/users/#{id}/mentees",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_mentee_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_mentee_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_mentee_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_mentee_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_mentor_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_mentor_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_mentor_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_mentor_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user mentors

  <p>
    Return a list of the user's mentors.
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
  @spec user_mentor_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_mentor_crud_list_400_json_resp()
             | Cyphi.Users.user_mentor_crud_list_403_json_resp()
             | Cyphi.Users.user_mentor_crud_list_404_json_resp()
             | Cyphi.Users.user_mentor_crud_list_405_json_resp()}
  def user_mentor_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_mentor_crud_list},
      url: "/users/#{id}/mentors",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_mentor_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_mentor_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_mentor_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_mentor_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_parent_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user parent

  <p>
    Add a parent to this user.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_parent_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.User.t()}
          | {:error,
             Cyphi.Users.user_parent_crud_create_400_json_resp()
             | Cyphi.Users.user_parent_crud_create_403_json_resp()
             | Cyphi.Users.user_parent_crud_create_404_json_resp()
             | Cyphi.Users.user_parent_crud_create_405_json_resp()}
  def user_parent_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_parent_crud_create},
      url: "/users/#{id}/parents",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.User, :t}},
        {400, {Cyphi.Users, :user_parent_crud_create_400_json_resp}},
        {403, {Cyphi.Users, :user_parent_crud_create_403_json_resp}},
        {404, {Cyphi.Users, :user_parent_crud_create_404_json_resp}},
        {405, {Cyphi.Users, :user_parent_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_parent_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type user_parent_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add user parents

  <p>
    Add up to 100 parents using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec user_parent_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Users.user_parent_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Users.user_parent_crud_create_batch_400_json_resp()
             | Cyphi.Users.user_parent_crud_create_batch_403_json_resp()
             | Cyphi.Users.user_parent_crud_create_batch_404_json_resp()
             | Cyphi.Users.user_parent_crud_create_batch_405_json_resp()}
  def user_parent_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Users, :user_parent_crud_create_batch},
      url: "/users/#{id}/parents/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Users, :user_parent_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Users, :user_parent_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Users, :user_parent_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Users, :user_parent_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Users, :user_parent_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_parent_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove user parent

  <p>
    Remove the specified parent from the user.
  </p>

  """
  @spec user_parent_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Users.user_parent_crud_delete_400_json_resp()
             | Cyphi.Users.user_parent_crud_delete_403_json_resp()
             | Cyphi.Users.user_parent_crud_delete_404_json_resp()
             | Cyphi.Users.user_parent_crud_delete_405_json_resp()}
  def user_parent_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Users, :user_parent_crud_delete},
      url: "/users/#{id}/parents/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Users, :user_parent_crud_delete_400_json_resp}},
        {403, {Cyphi.Users, :user_parent_crud_delete_403_json_resp}},
        {404, {Cyphi.Users, :user_parent_crud_delete_404_json_resp}},
        {405, {Cyphi.Users, :user_parent_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_parent_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_parent_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user parents

  <p>
    Return a list of the user's parents.
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
  @spec user_parent_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.User.t()]}
          | {:error,
             Cyphi.Users.user_parent_crud_list_400_json_resp()
             | Cyphi.Users.user_parent_crud_list_403_json_resp()
             | Cyphi.Users.user_parent_crud_list_404_json_resp()
             | Cyphi.Users.user_parent_crud_list_405_json_resp()}
  def user_parent_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Users, :user_parent_crud_list},
      url: "/users/#{id}/parents",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.User, :t}]},
        {400, {Cyphi.Users, :user_parent_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_parent_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_parent_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_parent_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_session_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_session_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_session_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_session_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user sessions

  <p>
    Return a list of the user's sessions.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, login_at, logout_at, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_session_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Session.t()]}
          | {:error,
             Cyphi.Users.user_session_crud_list_400_json_resp()
             | Cyphi.Users.user_session_crud_list_403_json_resp()
             | Cyphi.Users.user_session_crud_list_404_json_resp()
             | Cyphi.Users.user_session_crud_list_405_json_resp()}
  def user_session_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_session_crud_list},
      url: "/users/#{id}/sessions",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Session, :t}]},
        {400, {Cyphi.Users, :user_session_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_session_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_session_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_session_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type user_visit_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type user_visit_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type user_visit_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type user_visit_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List user visits

  <p>
    Return a list of the user's visits.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, started_at, ended_at, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec user_visit_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Visit.t()]}
          | {:error,
             Cyphi.Users.user_visit_crud_list_400_json_resp()
             | Cyphi.Users.user_visit_crud_list_403_json_resp()
             | Cyphi.Users.user_visit_crud_list_404_json_resp()
             | Cyphi.Users.user_visit_crud_list_405_json_resp()}
  def user_visit_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Users, :user_visit_crud_list},
      url: "/users/#{id}/visits",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Visit, :t}]},
        {400, {Cyphi.Users, :user_visit_crud_list_400_json_resp}},
        {403, {Cyphi.Users, :user_visit_crud_list_403_json_resp}},
        {404, {Cyphi.Users, :user_visit_crud_list_404_json_resp}},
        {405, {Cyphi.Users, :user_visit_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:user_assessment_grade_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_assessment_grade_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:user_child_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_child_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_assistant_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_assistant_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_assistant_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_assistant_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_instructor_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_instructor_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_instructor_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_instructor_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_learner_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_learner_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_learner_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_course_learner_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:user_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:user_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_direct_report_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_direct_report_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_direct_report_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_direct_report_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:user_friend_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_friend_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_admin_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_admin_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_admin_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_admin_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_assistant_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_assistant_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_assistant_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_assistant_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_leader_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_leader_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_leader_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_leader_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_member_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_member_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_member_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_group_member_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentee_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentee_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentee_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentee_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentor_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentor_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentor_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_mentor_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:user_parent_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_parent_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_session_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_session_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_session_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_session_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:user_visit_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:user_visit_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:user_visit_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:user_visit_crud_list_405_json_resp) do
    [message: :string]
  end
end
