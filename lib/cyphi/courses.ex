defmodule Cyphi.Courses do
  @moduledoc """
  Provides API endpoints related to courses
  """

  @default_client Cyphi.Client

  @type assessment_grade_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create assessment grade

  Create a grade for the provided user for this assessment. You must provide exactly one of percent, score, or grade.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec assessment_grade_crud_create(
          id :: integer,
          assessment_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Grade.t()}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_create_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_405_json_resp()}
  def assessment_grade_crud_create(id, assessment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id, body: body],
      call: {Cyphi.Courses, :assessment_grade_crud_create},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Grade, :t}},
        {400, {Cyphi.Courses, :assessment_grade_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type assessment_grade_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create assessment grades

  Create grades for the provided users for this assessment. For each entry, you must provide exactly one of percent, score, or grade.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec assessment_grade_crud_create_batch(
          id :: integer,
          assessment_id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok, Cyphi.Courses.assessment_grade_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_create_batch_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_batch_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_batch_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_create_batch_405_json_resp()}
  def assessment_grade_crud_create_batch(id, assessment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id, body: body],
      call: {Cyphi.Courses, :assessment_grade_crud_create_batch},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :assessment_grade_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :assessment_grade_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete an assessment's grade

  Delete a assessment's grade.
  """
  @spec assessment_grade_crud_delete(
          id :: integer,
          assessment_id :: integer,
          grade_id :: integer,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             Cyphi.Courses.assessment_grade_crud_delete_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_delete_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_delete_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_delete_405_json_resp()}
  def assessment_grade_crud_delete(id, assessment_id, grade_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id, grade_id: grade_id],
      call: {Cyphi.Courses, :assessment_grade_crud_delete},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades/#{grade_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :assessment_grade_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get an assessment's grade

  <p> 
  Get an assessment's grade
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, grader, assessment, course.

  """
  @spec assessment_grade_crud_get(
          id :: integer,
          assessment_id :: integer,
          grade_id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Grade.t()}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_get_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_get_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_get_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_get_405_json_resp()}
  def assessment_grade_crud_get(id, assessment_id, grade_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id, grade_id: grade_id],
      call: {Cyphi.Courses, :assessment_grade_crud_get},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades/#{grade_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Grade, :t}},
        {400, {Cyphi.Courses, :assessment_grade_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List an assessment's grades

  <p>
    List all the grades for the assessment.
    All of the grades are now displayed.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, id, assessment_id, course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, grader, assessment, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec assessment_grade_crud_list(id :: integer, assessment_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Grade.t()]}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_list_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_list_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_list_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_list_405_json_resp()}
  def assessment_grade_crud_list(id, assessment_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id],
      call: {Cyphi.Courses, :assessment_grade_crud_list},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Grade, :t}]},
        {400, {Cyphi.Courses, :assessment_grade_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update an assessment's grade

  Update the grade with the provided ID. If provided, you must provide exactly one of percent, score, or grade.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec assessment_grade_crud_update(
          id :: integer,
          assessment_id :: integer,
          grade_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Grade.t()}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_update_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_405_json_resp()}
  def assessment_grade_crud_update(id, assessment_id, grade_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id, grade_id: grade_id, body: body],
      call: {Cyphi.Courses, :assessment_grade_crud_update},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades/#{grade_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.Grade, :t}},
        {400, {Cyphi.Courses, :assessment_grade_crud_update_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_update_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_update_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_grade_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type assessment_grade_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type assessment_grade_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update assessment grades

  Update grades with the provided IDs. If provided, you must provide exactly one of percent, score, or grade for each entry.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec assessment_grade_crud_update_batch(
          id :: integer,
          assessment_id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok, Cyphi.Courses.assessment_grade_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.assessment_grade_crud_update_batch_400_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_batch_403_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_batch_404_json_resp()
             | Cyphi.Courses.assessment_grade_crud_update_batch_405_json_resp()}
  def assessment_grade_crud_update_batch(id, assessment_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id, body: body],
      call: {Cyphi.Courses, :assessment_grade_crud_update_batch},
      url: "/courses/#{id}/assessments/#{assessment_id}/grades/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :assessment_grade_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Courses, :assessment_grade_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_grade_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_grade_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_grade_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_result_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a assessment's result

  Return a assessment's result.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: grade, question, user.

  """
  @spec assessment_result_crud_get(
          id :: integer,
          assessment_id :: integer,
          id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Answer.t()}
          | {:error,
             Cyphi.Courses.assessment_result_crud_get_400_json_resp()
             | Cyphi.Courses.assessment_result_crud_get_403_json_resp()
             | Cyphi.Courses.assessment_result_crud_get_404_json_resp()
             | Cyphi.Courses.assessment_result_crud_get_405_json_resp()}
  def assessment_result_crud_get(id, assessment_id, id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id, id: id],
      call: {Cyphi.Courses, :assessment_result_crud_get},
      url: "/courses/#{id}/assessments/#{assessment_id}/results/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Answer, :t}},
        {400, {Cyphi.Courses, :assessment_result_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_result_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_result_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_result_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_result_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type assessment_result_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List assessment results

  Return a list of assessment results.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, user_id, position.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: grade, question, user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec assessment_result_crud_list(id :: integer, assessment_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Answer.t()]}
          | {:error,
             Cyphi.Courses.assessment_result_crud_list_400_json_resp()
             | Cyphi.Courses.assessment_result_crud_list_403_json_resp()
             | Cyphi.Courses.assessment_result_crud_list_404_json_resp()
             | Cyphi.Courses.assessment_result_crud_list_405_json_resp()}
  def assessment_result_crud_list(id, assessment_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id],
      call: {Cyphi.Courses, :assessment_result_crud_list},
      url: "/courses/#{id}/assessments/#{assessment_id}/results",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Answer, :t}]},
        {400, {Cyphi.Courses, :assessment_result_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_result_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_result_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_result_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_scorm_result_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get a assessment's scorm result

  Return a assessment's scorm result.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: grade, user.

  """
  @spec assessment_scorm_result_crud_get(
          id :: integer,
          assessment_id :: integer,
          id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.ScormAnswer.t()}
          | {:error,
             Cyphi.Courses.assessment_scorm_result_crud_get_400_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_get_403_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_get_404_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_get_405_json_resp()}
  def assessment_scorm_result_crud_get(id, assessment_id, id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id, id: id],
      call: {Cyphi.Courses, :assessment_scorm_result_crud_get},
      url: "/courses/#{id}/assessments/#{assessment_id}/scorm_results/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.ScormAnswer, :t}},
        {400, {Cyphi.Courses, :assessment_scorm_result_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_scorm_result_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_scorm_result_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_scorm_result_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type assessment_scorm_result_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type assessment_scorm_result_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List assessment scorm results

  Return a list of assessment scorm results.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, user_id, position.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: grade, user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec assessment_scorm_result_crud_list(
          id :: integer,
          assessment_id :: integer,
          opts :: keyword
        ) ::
          {:ok, [Cyphi.ScormAnswer.t()]}
          | {:error,
             Cyphi.Courses.assessment_scorm_result_crud_list_400_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_list_403_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_list_404_json_resp()
             | Cyphi.Courses.assessment_scorm_result_crud_list_405_json_resp()}
  def assessment_scorm_result_crud_list(id, assessment_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, assessment_id: assessment_id],
      call: {Cyphi.Courses, :assessment_scorm_result_crud_list},
      url: "/courses/#{id}/assessments/#{assessment_id}/scorm_results",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.ScormAnswer, :t}]},
        {400, {Cyphi.Courses, :assessment_scorm_result_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :assessment_scorm_result_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :assessment_scorm_result_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :assessment_scorm_result_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_create_400_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_403_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_404_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Create attendance record

  Create one attendance entry.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec attendance_session_user_attendance_crud_create(
          id :: integer,
          attendance_session_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.UserAttendance.t()}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_create_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_405_json_resp()}
  def attendance_session_user_attendance_crud_create(id, attendance_session_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, body: body],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_create},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.UserAttendance, :t}},
        {400, {Cyphi.Courses, :attendance_session_user_attendance_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :attendance_session_user_attendance_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :attendance_session_user_attendance_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :attendance_session_user_attendance_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_create_batch_202_json_resp :: %{
          batch_id: integer | nil
        }

  @type attendance_session_user_attendance_crud_create_batch_400_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_batch_403_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_batch_404_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_create_batch_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Create attendance records

  Create one or more attendance entries.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec attendance_session_user_attendance_crud_create_batch(
          id :: integer,
          attendance_session_id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok,
           Cyphi.Courses.attendance_session_user_attendance_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_create_batch_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_batch_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_batch_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_create_batch_405_json_resp()}
  def attendance_session_user_attendance_crud_create_batch(
        id,
        attendance_session_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, body: body],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch_202_json_resp}},
        {400,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch_400_json_resp}},
        {403,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch_403_json_resp}},
        {404,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch_404_json_resp}},
        {405,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_delete_400_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_delete_403_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_delete_404_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_delete_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Delete attendance record

  Delete one attendance entry.

  """
  @spec attendance_session_user_attendance_crud_delete(
          id :: integer,
          attendance_session_id :: integer,
          user_id :: integer,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_delete_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_delete_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_delete_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_delete_405_json_resp()}
  def attendance_session_user_attendance_crud_delete(
        id,
        attendance_session_id,
        user_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, user_id: user_id],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_delete},
      url:
        "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :attendance_session_user_attendance_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :attendance_session_user_attendance_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :attendance_session_user_attendance_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :attendance_session_user_attendance_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get attendance record

  Get attendance entry for one user.

  """
  @spec attendance_session_user_attendance_crud_get(
          id :: integer,
          attendance_session_id :: integer,
          user_id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.UserAttendance.t()}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_get_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_get_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_get_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_get_405_json_resp()}
  def attendance_session_user_attendance_crud_get(id, attendance_session_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, user_id: user_id],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_get},
      url:
        "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance/#{user_id}",
      method: :get,
      response: [
        {200, {Cyphi.UserAttendance, :t}},
        {400, {Cyphi.Courses, :attendance_session_user_attendance_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :attendance_session_user_attendance_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :attendance_session_user_attendance_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :attendance_session_user_attendance_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type attendance_session_user_attendance_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List attendance records

  List all attendance for one session.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, user_id.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec attendance_session_user_attendance_crud_list(
          id :: integer,
          attendance_session_id :: integer,
          opts :: keyword
        ) ::
          {:ok, [Cyphi.UserAttendance.t()]}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_list_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_list_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_list_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_list_405_json_resp()}
  def attendance_session_user_attendance_crud_list(id, attendance_session_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_list},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.UserAttendance, :t}]},
        {400, {Cyphi.Courses, :attendance_session_user_attendance_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :attendance_session_user_attendance_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :attendance_session_user_attendance_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :attendance_session_user_attendance_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_update_400_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_403_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_404_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Update attendance record

  Update one attendance entry.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec attendance_session_user_attendance_crud_update(
          id :: integer,
          attendance_session_id :: integer,
          user_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.UserAttendance.t()}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_update_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_405_json_resp()}
  def attendance_session_user_attendance_crud_update(
        id,
        attendance_session_id,
        user_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, user_id: user_id, body: body],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_update},
      url:
        "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.UserAttendance, :t}},
        {400, {Cyphi.Courses, :attendance_session_user_attendance_crud_update_400_json_resp}},
        {403, {Cyphi.Courses, :attendance_session_user_attendance_crud_update_403_json_resp}},
        {404, {Cyphi.Courses, :attendance_session_user_attendance_crud_update_404_json_resp}},
        {405, {Cyphi.Courses, :attendance_session_user_attendance_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type attendance_session_user_attendance_crud_update_batch_202_json_resp :: %{
          batch_id: integer | nil
        }

  @type attendance_session_user_attendance_crud_update_batch_400_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_batch_403_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_batch_404_json_resp :: %{
          message: String.t() | nil
        }

  @type attendance_session_user_attendance_crud_update_batch_405_json_resp :: %{
          message: String.t() | nil
        }

  @doc """
  Update attendance records

  Update one or more attendance entries.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec attendance_session_user_attendance_crud_update_batch(
          id :: integer,
          attendance_session_id :: integer,
          body :: [map],
          opts :: keyword
        ) ::
          {:ok,
           Cyphi.Courses.attendance_session_user_attendance_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.attendance_session_user_attendance_crud_update_batch_400_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_batch_403_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_batch_404_json_resp()
             | Cyphi.Courses.attendance_session_user_attendance_crud_update_batch_405_json_resp()}
  def attendance_session_user_attendance_crud_update_batch(
        id,
        attendance_session_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, body: body],
      call: {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}/user_attendance/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch_202_json_resp}},
        {400,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch_400_json_resp}},
        {403,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch_403_json_resp}},
        {404,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch_404_json_resp}},
        {405,
         {Cyphi.Courses, :attendance_session_user_attendance_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assessment_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course assessment

  <p>
    Return the assessment with the specified ID.
  </p>
  """
  @spec course_assessment_crud_get(id :: integer, assessment_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Assessment.t()}
          | {:error,
             Cyphi.Courses.course_assessment_crud_get_400_json_resp()
             | Cyphi.Courses.course_assessment_crud_get_403_json_resp()
             | Cyphi.Courses.course_assessment_crud_get_404_json_resp()
             | Cyphi.Courses.course_assessment_crud_get_405_json_resp()}
  def course_assessment_crud_get(id, assessment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, assessment_id: assessment_id],
      call: {Cyphi.Courses, :course_assessment_crud_get},
      url: "/courses/#{id}/assessments/#{assessment_id}",
      method: :get,
      response: [
        {200, {Cyphi.Assessment, :t}},
        {400, {Cyphi.Courses, :course_assessment_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_assessment_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_assessment_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_assessment_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assessment_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_assessment_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course assessments

  <p>
    Return a list of the course's assessments.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, course_id, given, grading.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_assessment_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Assessment.t()]}
          | {:error,
             Cyphi.Courses.course_assessment_crud_list_400_json_resp()
             | Cyphi.Courses.course_assessment_crud_list_403_json_resp()
             | Cyphi.Courses.course_assessment_crud_list_404_json_resp()
             | Cyphi.Courses.course_assessment_crud_list_405_json_resp()}
  def course_assessment_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_assessment_crud_list},
      url: "/courses/#{id}/assessments",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Assessment, :t}]},
        {400, {Cyphi.Courses, :course_assessment_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_assessment_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_assessment_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_assessment_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assistant_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course assistant

  <p>
    Add a course assistant.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_assistant_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Assistant.t()}
          | {:error,
             Cyphi.Courses.course_assistant_crud_create_400_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_403_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_404_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_405_json_resp()}
  def course_assistant_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_assistant_crud_create},
      url: "/courses/#{id}/assistants",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Assistant, :t}},
        {400, {Cyphi.Courses, :course_assistant_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :course_assistant_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :course_assistant_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :course_assistant_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assistant_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_assistant_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course assistants

  <p>
    Add up to 100 course assistants using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_assistant_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_assistant_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_assistant_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_assistant_crud_create_batch_405_json_resp()}
  def course_assistant_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_assistant_crud_create_batch},
      url: "/courses/#{id}/assistants/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_assistant_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_assistant_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_assistant_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_assistant_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_assistant_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assistant_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove course assistant

  <p>
    Remove the specified assistant from the course.
  </p>
  """
  @spec course_assistant_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Courses.course_assistant_crud_delete_400_json_resp()
             | Cyphi.Courses.course_assistant_crud_delete_403_json_resp()
             | Cyphi.Courses.course_assistant_crud_delete_404_json_resp()
             | Cyphi.Courses.course_assistant_crud_delete_405_json_resp()}
  def course_assistant_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_assistant_crud_delete},
      url: "/courses/#{id}/assistants/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :course_assistant_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :course_assistant_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :course_assistant_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :course_assistant_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assistant_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course assistant

  <p>
    Return the assistant record for the specified user. Note that this does not return the user object, although you
    can use $include=user if you want to get the user object as well
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.

  """
  @spec course_assistant_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Assistant.t()}
          | {:error,
             Cyphi.Courses.course_assistant_crud_get_400_json_resp()
             | Cyphi.Courses.course_assistant_crud_get_403_json_resp()
             | Cyphi.Courses.course_assistant_crud_get_404_json_resp()
             | Cyphi.Courses.course_assistant_crud_get_405_json_resp()}
  def course_assistant_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_assistant_crud_get},
      url: "/courses/#{id}/assistants/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Assistant, :t}},
        {400, {Cyphi.Courses, :course_assistant_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_assistant_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_assistant_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_assistant_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_assistant_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_assistant_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course assistants

  <p>
    Return a list of the course assistants. Note that this does not return user objects, it returns assistant records
    that include the user_id. You can use $include=user if you want to get the user object as well. Assistant records
    are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_assistant_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Assistant.t()]}
          | {:error,
             Cyphi.Courses.course_assistant_crud_list_400_json_resp()
             | Cyphi.Courses.course_assistant_crud_list_403_json_resp()
             | Cyphi.Courses.course_assistant_crud_list_404_json_resp()
             | Cyphi.Courses.course_assistant_crud_list_405_json_resp()}
  def course_assistant_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_assistant_crud_list},
      url: "/courses/#{id}/assistants",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Assistant, :t}]},
        {400, {Cyphi.Courses, :course_assistant_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_assistant_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_assistant_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_assistant_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create attendance session

  Create and attendance session in this course.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_attendance_session_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.AttendanceSession.t()}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_create_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_405_json_resp()}
  def course_attendance_session_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_attendance_session_crud_create},
      url: "/courses/#{id}/attendance_sessions",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.AttendanceSession, :t}},
        {400, {Cyphi.Courses, :course_attendance_session_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_attendance_session_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create attendance sessions

  Create one or more attendance sessions in this course in batch.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_attendance_session_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_attendance_session_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_create_batch_405_json_resp()}
  def course_attendance_session_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_attendance_session_crud_create_batch},
      url: "/courses/#{id}/attendance_sessions/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_attendance_session_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_attendance_session_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete attendance session

  Delete an attendance session in this course.

  """
  @spec course_attendance_session_crud_delete(
          id :: integer,
          attendance_session_id :: integer,
          opts :: keyword
        ) ::
          :ok
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_delete_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_delete_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_delete_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_delete_405_json_resp()}
  def course_attendance_session_crud_delete(id, attendance_session_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id],
      call: {Cyphi.Courses, :course_attendance_session_crud_delete},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :course_attendance_session_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get attendance session

  Get an attendance session from this course.

  """
  @spec course_attendance_session_crud_get(
          id :: integer,
          attendance_session_id :: integer,
          opts :: keyword
        ) ::
          {:ok, Cyphi.AttendanceSession.t()}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_get_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_get_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_get_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_get_405_json_resp()}
  def course_attendance_session_crud_get(id, attendance_session_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id],
      call: {Cyphi.Courses, :course_attendance_session_crud_get},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}",
      method: :get,
      response: [
        {200, {Cyphi.AttendanceSession, :t}},
        {400, {Cyphi.Courses, :course_attendance_session_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List attendance sessions

  Return a list of course attendance sessions.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, started_at, finished_at.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec course_attendance_session_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.AttendanceSession.t()]}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_list_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_list_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_list_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_list_405_json_resp()}
  def course_attendance_session_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_attendance_session_crud_list},
      url: "/courses/#{id}/attendance_sessions",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.AttendanceSession, :t}]},
        {400, {Cyphi.Courses, :course_attendance_session_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update attendance session

  Update and attendance session in this course.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_attendance_session_crud_update(
          id :: integer,
          attendance_session_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.AttendanceSession.t()}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_update_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_405_json_resp()}
  def course_attendance_session_crud_update(id, attendance_session_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, attendance_session_id: attendance_session_id, body: body],
      call: {Cyphi.Courses, :course_attendance_session_crud_update},
      url: "/courses/#{id}/attendance_sessions/#{attendance_session_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.AttendanceSession, :t}},
        {400, {Cyphi.Courses, :course_attendance_session_crud_update_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_update_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_update_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_attendance_session_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_attendance_session_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_attendance_session_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update attendance sessions

  Update one or more attendance sessions in this course in batch.

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_attendance_session_crud_update_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_attendance_session_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_attendance_session_crud_update_batch_400_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_batch_403_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_batch_404_json_resp()
             | Cyphi.Courses.course_attendance_session_crud_update_batch_405_json_resp()}
  def course_attendance_session_crud_update_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_attendance_session_crud_update_batch},
      url: "/courses/#{id}/attendance_sessions/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_attendance_session_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_attendance_session_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_attendance_session_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_attendance_session_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_attendance_session_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_child_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_child_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create course children

  <p>
    Create up to 50 children of the specified course using a batch job.
  </p>

  ## Options

    * `$options`: Valid options are: deep_copy

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_child_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_child_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_child_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_child_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_child_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_child_crud_create_batch_405_json_resp()}
  def course_child_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_child_crud_create_batch},
      url: "/courses/#{id}/children/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_child_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_child_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_child_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_child_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_child_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_child_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_child_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course children

  Return a list of the children of the course with the specified ID .

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: archived (default: false), organization_id, id, name, course_code, sis_id, sis_pid, path, tags, metadata.creator_id, metadata.created_at, metadata.language.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent, current_module, organization.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec course_child_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Course.t()]}
          | {:error,
             Cyphi.Courses.course_child_crud_list_400_json_resp()
             | Cyphi.Courses.course_child_crud_list_403_json_resp()
             | Cyphi.Courses.course_child_crud_list_404_json_resp()
             | Cyphi.Courses.course_child_crud_list_405_json_resp()}
  def course_child_crud_list(id, opts \\ []) do
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
      call: {Cyphi.Courses, :course_child_crud_list},
      url: "/courses/#{id}/children",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Course, :t}]},
        {400, {Cyphi.Courses, :course_child_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_child_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_child_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_child_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_copy_202_json_resp :: %{batch_id: integer | nil}

  @type course_copy_400_json_resp :: %{message: String.t() | nil}

  @type course_copy_403_json_resp :: %{message: String.t() | nil}

  @type course_copy_404_json_resp :: %{message: String.t() | nil}

  @type course_copy_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Copy course

  <p>
    Create one or more copies of the specified course using a batch job.
  </p>

  ## Options

    * `$options`: Valid options are: deep_copy

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_copy(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_copy_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_copy_400_json_resp()
             | Cyphi.Courses.course_copy_403_json_resp()
             | Cyphi.Courses.course_copy_404_json_resp()
             | Cyphi.Courses.course_copy_405_json_resp()}
  def course_copy(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_copy},
      url: "/courses/#{id}/copy/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_copy_202_json_resp}},
        {400, {Cyphi.Courses, :course_copy_400_json_resp}},
        {403, {Cyphi.Courses, :course_copy_403_json_resp}},
        {404, {Cyphi.Courses, :course_copy_404_json_resp}},
        {405, {Cyphi.Courses, :course_copy_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create course

  <p>
    Create a course.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_crud_create(body :: map, opts :: keyword) ::
          {:ok, Cyphi.Course.t()}
          | {:error,
             Cyphi.Courses.course_crud_create_400_json_resp()
             | Cyphi.Courses.course_crud_create_403_json_resp()
             | Cyphi.Courses.course_crud_create_404_json_resp()
             | Cyphi.Courses.course_crud_create_405_json_resp()}
  def course_crud_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Courses, :course_crud_create},
      url: "/courses",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Course, :t}},
        {400, {Cyphi.Courses, :course_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Create courses

  <p>
    Create up to 50 courses using a batch job.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_crud_create_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_crud_create_batch_405_json_resp()}
  def course_crud_create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Courses, :course_crud_create_batch},
      url: "/courses/batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Delete course

  <p>
    Delete the course with the specified ID. This places the course into your trash can where it will be
    permanently deleted after 30 days. You can restore it from the trash at anytime before the 30 days are up.
  </p>
  """
  @spec course_crud_delete(id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Courses.course_crud_delete_400_json_resp()
             | Cyphi.Courses.course_crud_delete_403_json_resp()
             | Cyphi.Courses.course_crud_delete_404_json_resp()
             | Cyphi.Courses.course_crud_delete_405_json_resp()}
  def course_crud_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_crud_delete},
      url: "/courses/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :course_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course

  <p>
    Return the course with the specified ID.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: parent, current_module, organization.

  """
  @spec course_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Course.t()}
          | {:error,
             Cyphi.Courses.course_crud_get_400_json_resp()
             | Cyphi.Courses.course_crud_get_403_json_resp()
             | Cyphi.Courses.course_crud_get_404_json_resp()
             | Cyphi.Courses.course_crud_get_405_json_resp()}
  def course_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_crud_get},
      url: "/courses/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Course, :t}},
        {400, {Cyphi.Courses, :course_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List courses

  <p>
    Return a list of courses. By default, archived courses are not returned, and you can use the filter
    archived=true if you want to get a list of archived courses.
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
  @spec course_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Course.t()]}
          | {:error,
             Cyphi.Courses.course_crud_list_400_json_resp()
             | Cyphi.Courses.course_crud_list_403_json_resp()
             | Cyphi.Courses.course_crud_list_404_json_resp()
             | Cyphi.Courses.course_crud_list_405_json_resp()}
  def course_crud_list(opts \\ []) do
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
      call: {Cyphi.Courses, :course_crud_list},
      url: "/courses",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Course, :t}]},
        {400, {Cyphi.Courses, :course_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update course

  <p>
    Update the course with the specified ID.
    Note that to archive/unarchive a course, you can simply update its archived attribute.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_crud_update(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Course.t()}
          | {:error,
             Cyphi.Courses.course_crud_update_400_json_resp()
             | Cyphi.Courses.course_crud_update_403_json_resp()
             | Cyphi.Courses.course_crud_update_404_json_resp()
             | Cyphi.Courses.course_crud_update_405_json_resp()}
  def course_crud_update(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_crud_update},
      url: "/courses/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.Course, :t}},
        {400, {Cyphi.Courses, :course_crud_update_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_update_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_update_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update courses

  <p>
    Update up to 50 courses using a batch job.
    Note that to archive/unarchive a course, you can simply update its archived attribute.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_crud_update_batch(body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_crud_update_batch_400_json_resp()
             | Cyphi.Courses.course_crud_update_batch_403_json_resp()
             | Cyphi.Courses.course_crud_update_batch_404_json_resp()
             | Cyphi.Courses.course_crud_update_batch_405_json_resp()}
  def course_crud_update_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Cyphi.Courses, :course_crud_update_batch},
      url: "/courses/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_group_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course group

  Return a course's group.
  """
  @spec course_group_crud_get(id :: integer, group_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Group.t()}
          | {:error,
             Cyphi.Courses.course_group_crud_get_400_json_resp()
             | Cyphi.Courses.course_group_crud_get_403_json_resp()
             | Cyphi.Courses.course_group_crud_get_404_json_resp()
             | Cyphi.Courses.course_group_crud_get_405_json_resp()}
  def course_group_crud_get(id, group_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, group_id: group_id],
      call: {Cyphi.Courses, :course_group_crud_get},
      url: "/courses/#{id}/groups/#{group_id}",
      method: :get,
      response: [
        {200, {Cyphi.Group, :t}},
        {400, {Cyphi.Courses, :course_group_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_group_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_group_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_group_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_group_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_group_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course groups

  Return a list of course groups.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, visibility, tags, container_type, metadata.creator_id, metadata.created_at, metadata.language.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec course_group_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Group.t()]}
          | {:error,
             Cyphi.Courses.course_group_crud_list_400_json_resp()
             | Cyphi.Courses.course_group_crud_list_403_json_resp()
             | Cyphi.Courses.course_group_crud_list_404_json_resp()
             | Cyphi.Courses.course_group_crud_list_405_json_resp()}
  def course_group_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_group_crud_list},
      url: "/courses/#{id}/groups",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Group, :t}]},
        {400, {Cyphi.Courses, :course_group_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_group_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_group_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_group_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_instructor_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course instructor

  <p>
    Add a course instructor.
  </p>

  <p>
    By default, a user is not notified that they have been added as an instructor to the course. If you want them to receive
    a notification, set the optional send_notification parameter to true.
    For example: POST /courses/27/instructors?send_notification=true {user_id: 46688}
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_instructor_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Instructor.t()}
          | {:error,
             Cyphi.Courses.course_instructor_crud_create_400_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_403_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_404_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_405_json_resp()}
  def course_instructor_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_instructor_crud_create},
      url: "/courses/#{id}/instructors",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Instructor, :t}},
        {400, {Cyphi.Courses, :course_instructor_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :course_instructor_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :course_instructor_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :course_instructor_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_instructor_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_instructor_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course instructors

  <p>
    Add up to 100 course instructors using a batch job.
  </p>

  <p>
    By default, a user is not notified that they have been added as an instructor to the course. If you want them to receive
    a notification, set the optional send_notification parameter to true.
    For example: POST /courses/27/instructors?send_notification=true {user_id: 46688}
  </p>

  ## Options

    * `$options`: Valid options are: send_notification

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_instructor_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_instructor_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_instructor_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_instructor_crud_create_batch_405_json_resp()}
  def course_instructor_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_instructor_crud_create_batch},
      url: "/courses/#{id}/instructors/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_instructor_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_instructor_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_instructor_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_instructor_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_instructor_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_instructor_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove course instructor

  <p>
    Remove the specified instructor from the course.
  </p>
  """
  @spec course_instructor_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Courses.course_instructor_crud_delete_400_json_resp()
             | Cyphi.Courses.course_instructor_crud_delete_403_json_resp()
             | Cyphi.Courses.course_instructor_crud_delete_404_json_resp()
             | Cyphi.Courses.course_instructor_crud_delete_405_json_resp()}
  def course_instructor_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_instructor_crud_delete},
      url: "/courses/#{id}/instructors/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :course_instructor_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :course_instructor_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :course_instructor_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :course_instructor_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_instructor_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course instructor

  <p>
    Return the instructor record for the specified user. Note that this does not return the user object, although you
    can use $include=user if you want to get the user object as well
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.

  """
  @spec course_instructor_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Instructor.t()}
          | {:error,
             Cyphi.Courses.course_instructor_crud_get_400_json_resp()
             | Cyphi.Courses.course_instructor_crud_get_403_json_resp()
             | Cyphi.Courses.course_instructor_crud_get_404_json_resp()
             | Cyphi.Courses.course_instructor_crud_get_405_json_resp()}
  def course_instructor_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_instructor_crud_get},
      url: "/courses/#{id}/instructors/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Instructor, :t}},
        {400, {Cyphi.Courses, :course_instructor_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_instructor_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_instructor_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_instructor_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_instructor_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_instructor_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course instructors

  <p>
    Return a list of the course instructors. Note that this does not return user objects, it returns instructor records
    that include the user_id. You can use $include=user if you want to get the user object as well. Instructor records
    are not returned for users that are archived.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, coinstructor.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_instructor_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Instructor.t()]}
          | {:error,
             Cyphi.Courses.course_instructor_crud_list_400_json_resp()
             | Cyphi.Courses.course_instructor_crud_list_403_json_resp()
             | Cyphi.Courses.course_instructor_crud_list_404_json_resp()
             | Cyphi.Courses.course_instructor_crud_list_405_json_resp()}
  def course_instructor_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_instructor_crud_list},
      url: "/courses/#{id}/instructors",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Instructor, :t}]},
        {400, {Cyphi.Courses, :course_instructor_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_instructor_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_instructor_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_instructor_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_create_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course learner

  <p>
    Add a course learner.
  </p>

  <p>
    By default, a user is not notified that they have been added as a learner to the course and you are not allowed to
    re-enroll existing students. If you want them to receive
    a notification, set the optional send_notification parameter to true.
  </p>

  <p>The default behavior can be changed by passing these options:</p>
  <ul>
    <li><b>send_notification (boolean)</b>: notify the user that they have been enrolled</li>
    <li><b>reenroll (string):</b>
      <ul>
        <li>never: default value, re-enrolling is not allowed</li>
        <li>only_completed: allow re-enrolling students who have completed the course</li>
        <li>always: allow re-enrolling of any student</li>
      </ul>
    </li>
    <li><b>increment_seats (boolean)</b>: if true and no seats are remaining in the course, an additional seat is added to the course before enrolling the student. If seats are available, no change is made to the maximum number of seats. </li>
  </ul>
  <p>Add the options as a JSON object to the $options parameter.</p>
  <p><b>For example:</b>
    POST /courses/27/learners?$options={“send_notification”:true,”reenroll”:”only_completed”,"increment_seats":true}
  </p>

  ## Options

    * `$options`: Valid options are: send_notification, reenroll, increment_seats

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_learner_crud_create(id :: integer, body :: map, opts :: keyword) ::
          {:ok, Cyphi.Learner.t()}
          | {:error,
             Cyphi.Courses.course_learner_crud_create_400_json_resp()
             | Cyphi.Courses.course_learner_crud_create_403_json_resp()
             | Cyphi.Courses.course_learner_crud_create_404_json_resp()
             | Cyphi.Courses.course_learner_crud_create_405_json_resp()}
  def course_learner_crud_create(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_learner_crud_create},
      url: "/courses/#{id}/learners",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {201, {Cyphi.Learner, :t}},
        {400, {Cyphi.Courses, :course_learner_crud_create_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_create_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_create_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_create_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_create_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_learner_crud_create_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_create_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Add course learners

  <p>
    Add up to 100 learners to the course using a batch job.
  </p>

  <p>
    By default, a user is not notified that they have been added as a learner to the course and you are not allowed to
    re-enroll existing students. If you want them to receive
    a notification, set the optional send_notification parameter to true.
  </p>

  <p>The default behavior can be changed by passing these options:</p>
  <ul>
    <li><b>send_notification (boolean)</b>: notify the user that they have been enrolled</li>
    <li><b>reenroll (string):</b>
      <ul>
        <li>never: default value, re-enrolling is not allowed</li>
        <li>only_completed: allow re-enrolling students who have completed the course</li>
        <li>always: allow re-enrolling of any student</li>
      </ul>
    </li>
    <li><b>increment_seats (boolean)</b>: if true and no seats are remaining in the course, an additional seat is added to the course before enrolling the student. If seats are available, no change is made to the maximum number of seats. </li>
  </ul>
  <p>Add the options as a JSON object to the $options parameter.</p>
  <p><b>For example:</b>
    POST /courses/27/learners?$options={“send_notification”:true,”reenroll”:”only_completed”,"increment_seats":true}
  </p>

  ## Options

    * `$options`: Valid options are: send_notification, reenroll, increment_seats

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_learner_crud_create_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_learner_crud_create_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_learner_crud_create_batch_400_json_resp()
             | Cyphi.Courses.course_learner_crud_create_batch_403_json_resp()
             | Cyphi.Courses.course_learner_crud_create_batch_404_json_resp()
             | Cyphi.Courses.course_learner_crud_create_batch_405_json_resp()}
  def course_learner_crud_create_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$options"])

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_learner_crud_create_batch},
      url: "/courses/#{id}/learners/batch",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_learner_crud_create_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_learner_crud_create_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_create_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_create_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_create_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_delete_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_delete_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_delete_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_delete_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Remove course learner

  <p>
    Remove the specified learner from the course.
  </p>
  """
  @spec course_learner_crud_delete(id :: integer, user_id :: integer, opts :: keyword) ::
          :ok
          | {:error,
             Cyphi.Courses.course_learner_crud_delete_400_json_resp()
             | Cyphi.Courses.course_learner_crud_delete_403_json_resp()
             | Cyphi.Courses.course_learner_crud_delete_404_json_resp()
             | Cyphi.Courses.course_learner_crud_delete_405_json_resp()}
  def course_learner_crud_delete(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_learner_crud_delete},
      url: "/courses/#{id}/learners/#{user_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Cyphi.Courses, :course_learner_crud_delete_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_delete_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_delete_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_delete_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course learner

  <p>
    Return the learner record for the specified user. Note that this does not return the user object, although you
    can use $include=user if you want to get the user object as well
  </p>

  <p>
    Learner records are lightweight and include only information about the learner's enrollment status. If you want
    additional progress information such as the learner's current score percent, grade, percent progress,
    mastery percent and mastery classification, you can use $include=progress to include the Learner progress record.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course, progress, enrolled_by, unenrolled_by, deactivated_by, reactivated_by, transferred_by, transferred_from, transferred_to, order_item.

  """
  @spec course_learner_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Learner.t()}
          | {:error,
             Cyphi.Courses.course_learner_crud_get_400_json_resp()
             | Cyphi.Courses.course_learner_crud_get_403_json_resp()
             | Cyphi.Courses.course_learner_crud_get_404_json_resp()
             | Cyphi.Courses.course_learner_crud_get_405_json_resp()}
  def course_learner_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Courses, :course_learner_crud_get},
      url: "/courses/#{id}/learners/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Learner, :t}},
        {400, {Cyphi.Courses, :course_learner_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course learners

  <p>
    Return a list of the course learners. Note that this does not return user objects, it returns their learner records
    that include the user_id. You can use $include=user if you want to get the user object as well. Learner records
    are not returned for users that are archived.
  </p>

  <p>
    By default, this operation returns learners that are active, completed, or deactivated. It does not return
    learners that were unenrolled. You can use filters to return a specific set of learners based on their status.
    For example, /courses/ID/learners?$filter={"completed": true} will only return learners that have completed the course.
  </p>

  <p>
    Learner records are lightweight and include only information about the learner's enrollment status. If you want
    additional progress information such as the learner's current score percent, grade, percent progress,
    mastery percent and mastery classification, you can use $include=progress to include the Learner progress record
    with each list item.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, enrolled_at, started, started_at, completed, completed_at, completed_by_id, unenrolled (default: false), unenrolled_at, deactivated, deactivated_at, reactivated_at, transferred, transferred_at, course_archived (default: false), user_archived (default: false), last_visited_at.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course, progress, enrolled_by, unenrolled_by, deactivated_by, reactivated_by, transferred_by, transferred_from, transferred_to, order_item.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_learner_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Learner.t()]}
          | {:error,
             Cyphi.Courses.course_learner_crud_list_400_json_resp()
             | Cyphi.Courses.course_learner_crud_list_403_json_resp()
             | Cyphi.Courses.course_learner_crud_list_404_json_resp()
             | Cyphi.Courses.course_learner_crud_list_405_json_resp()}
  def course_learner_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_learner_crud_list},
      url: "/courses/#{id}/learners",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Learner, :t}]},
        {400, {Cyphi.Courses, :course_learner_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_update_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update course learner

  <p>
    Update the course learner.
  </p>

  <p>
    Note that to complete/deactivate/unenroll a learner, you can simply update the
    corresponding attribute. When one of these special attributes is changed, it starts a background job to perform
    the actual action, so it maybe be a minute or so before the change is reflected in the learner's status.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_learner_crud_update(
          id :: integer,
          user_id :: integer,
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Cyphi.Learner.t()}
          | {:error,
             Cyphi.Courses.course_learner_crud_update_400_json_resp()
             | Cyphi.Courses.course_learner_crud_update_403_json_resp()
             | Cyphi.Courses.course_learner_crud_update_404_json_resp()
             | Cyphi.Courses.course_learner_crud_update_405_json_resp()}
  def course_learner_crud_update(id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, user_id: user_id, body: body],
      call: {Cyphi.Courses, :course_learner_crud_update},
      url: "/courses/#{id}/learners/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Cyphi.Learner, :t}},
        {400, {Cyphi.Courses, :course_learner_crud_update_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_update_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_update_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_update_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_update_batch_202_json_resp :: %{batch_id: integer | nil}

  @type course_learner_crud_update_batch_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_batch_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_batch_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_update_batch_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Update course learners

  <p>
    Update up to 100 course learners. Note that to complete/deactivate/unenroll a learner, you can simply update the
    corresponding attribute. When one of these special attributes is changed, it starts a background job to perform
    the actual action, so it maybe be a minute or so before the change is reflected in the learner's status.
  </p>

  ## Request Body

  **Content Types**: `application/json`

  Here is the format of a request.
  """
  @spec course_learner_crud_update_batch(id :: integer, body :: [map], opts :: keyword) ::
          {:ok, Cyphi.Courses.course_learner_crud_update_batch_202_json_resp()}
          | {:error,
             Cyphi.Courses.course_learner_crud_update_batch_400_json_resp()
             | Cyphi.Courses.course_learner_crud_update_batch_403_json_resp()
             | Cyphi.Courses.course_learner_crud_update_batch_404_json_resp()
             | Cyphi.Courses.course_learner_crud_update_batch_405_json_resp()}
  def course_learner_crud_update_batch(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Cyphi.Courses, :course_learner_crud_update_batch},
      url: "/courses/#{id}/learners/batch",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [
        {202, {Cyphi.Courses, :course_learner_crud_update_batch_202_json_resp}},
        {400, {Cyphi.Courses, :course_learner_crud_update_batch_400_json_resp}},
        {403, {Cyphi.Courses, :course_learner_crud_update_batch_403_json_resp}},
        {404, {Cyphi.Courses, :course_learner_crud_update_batch_404_json_resp}},
        {405, {Cyphi.Courses, :course_learner_crud_update_batch_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_module_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get module

  Return a course's module.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: course.

  """
  @spec course_module_crud_get(id :: integer, module_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Module.t()}
          | {:error,
             Cyphi.Courses.course_module_crud_get_400_json_resp()
             | Cyphi.Courses.course_module_crud_get_403_json_resp()
             | Cyphi.Courses.course_module_crud_get_404_json_resp()
             | Cyphi.Courses.course_module_crud_get_405_json_resp()}
  def course_module_crud_get(id, module_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, module_id: module_id],
      call: {Cyphi.Courses, :course_module_crud_get},
      url: "/courses/#{id}/modules/#{module_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Module, :t}},
        {400, {Cyphi.Courses, :course_module_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_module_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_module_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_module_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_module_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_module_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List modules

  Return a list of course modules.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, start_at, begin_at, end_at, course_id, tags.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_module_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Module.t()]}
          | {:error,
             Cyphi.Courses.course_module_crud_list_400_json_resp()
             | Cyphi.Courses.course_module_crud_list_403_json_resp()
             | Cyphi.Courses.course_module_crud_list_404_json_resp()
             | Cyphi.Courses.course_module_crud_list_405_json_resp()}
  def course_module_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_module_crud_list},
      url: "/courses/#{id}/modules",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Module, :t}]},
        {400, {Cyphi.Courses, :course_module_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_module_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_module_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_module_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_referencing_section_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course reference section

  <p> 
  Get a course reference section by id.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.

  """
  @spec course_referencing_section_crud_get(id :: integer, section_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Section.t()}
          | {:error,
             Cyphi.Courses.course_referencing_section_crud_get_400_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_get_403_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_get_404_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_get_405_json_resp()}
  def course_referencing_section_crud_get(id, section_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, section_id: section_id],
      call: {Cyphi.Courses, :course_referencing_section_crud_get},
      url: "/courses/#{id}/referencing_sections/#{section_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Section, :t}},
        {400, {Cyphi.Courses, :course_referencing_section_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_referencing_section_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_referencing_section_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_referencing_section_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_referencing_section_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_referencing_section_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course reference sections

  <p> 
  List sections that reference this course inside paths.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, type, module_id, referenced_course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_referencing_section_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Section.t()]}
          | {:error,
             Cyphi.Courses.course_referencing_section_crud_list_400_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_list_403_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_list_404_json_resp()
             | Cyphi.Courses.course_referencing_section_crud_list_405_json_resp()}
  def course_referencing_section_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_referencing_section_crud_list},
      url: "/courses/#{id}/referencing_sections",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Section, :t}]},
        {400, {Cyphi.Courses, :course_referencing_section_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_referencing_section_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_referencing_section_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_referencing_section_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_section_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get course section

  <p> 
  Get a course section by id.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.

  """
  @spec course_section_crud_get(id :: integer, section_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Section.t()}
          | {:error,
             Cyphi.Courses.course_section_crud_get_400_json_resp()
             | Cyphi.Courses.course_section_crud_get_403_json_resp()
             | Cyphi.Courses.course_section_crud_get_404_json_resp()
             | Cyphi.Courses.course_section_crud_get_405_json_resp()}
  def course_section_crud_get(id, section_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, section_id: section_id],
      call: {Cyphi.Courses, :course_section_crud_get},
      url: "/courses/#{id}/sections/#{section_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Section, :t}},
        {400, {Cyphi.Courses, :course_section_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :course_section_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :course_section_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :course_section_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_section_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_section_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List course sections

  <p> 
  All sections in a course. Can be filtered by type, for example you can only fetch ClassSection items.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, type, module_id, referenced_course_id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: module, referenced_course.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_section_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Section.t()]}
          | {:error,
             Cyphi.Courses.course_section_crud_list_400_json_resp()
             | Cyphi.Courses.course_section_crud_list_403_json_resp()
             | Cyphi.Courses.course_section_crud_list_404_json_resp()
             | Cyphi.Courses.course_section_crud_list_405_json_resp()}
  def course_section_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Courses, :course_section_crud_list},
      url: "/courses/#{id}/sections",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Section, :t}]},
        {400, {Cyphi.Courses, :course_section_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :course_section_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :course_section_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :course_section_crud_list_405_json_resp}}
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
             Cyphi.Courses.module_section_crud_get_400_json_resp()
             | Cyphi.Courses.module_section_crud_get_403_json_resp()
             | Cyphi.Courses.module_section_crud_get_404_json_resp()
             | Cyphi.Courses.module_section_crud_get_405_json_resp()}
  def module_section_crud_get(id, module_id, section_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, module_id: module_id, section_id: section_id],
      call: {Cyphi.Courses, :module_section_crud_get},
      url: "/courses/#{id}/modules/#{module_id}/sections/#{section_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Section, :t}},
        {400, {Cyphi.Courses, :module_section_crud_get_400_json_resp}},
        {403, {Cyphi.Courses, :module_section_crud_get_403_json_resp}},
        {404, {Cyphi.Courses, :module_section_crud_get_404_json_resp}},
        {405, {Cyphi.Courses, :module_section_crud_get_405_json_resp}}
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
             Cyphi.Courses.module_section_crud_list_400_json_resp()
             | Cyphi.Courses.module_section_crud_list_403_json_resp()
             | Cyphi.Courses.module_section_crud_list_404_json_resp()
             | Cyphi.Courses.module_section_crud_list_405_json_resp()}
  def module_section_crud_list(id, module_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, module_id: module_id],
      call: {Cyphi.Courses, :module_section_crud_list},
      url: "/courses/#{id}/modules/#{module_id}/sections",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Section, :t}]},
        {400, {Cyphi.Courses, :module_section_crud_list_400_json_resp}},
        {403, {Cyphi.Courses, :module_section_crud_list_403_json_resp}},
        {404, {Cyphi.Courses, :module_section_crud_list_404_json_resp}},
        {405, {Cyphi.Courses, :module_section_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:assessment_grade_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:assessment_grade_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:assessment_grade_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_grade_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_result_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:assessment_scorm_result_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:attendance_session_user_attendance_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assessment_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_assistant_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_assistant_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_attendance_session_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_attendance_session_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_attendance_session_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_child_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_child_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_copy_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_copy_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_copy_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_copy_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_copy_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_group_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_instructor_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_instructor_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_learner_crud_create_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_create_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_delete_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_delete_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_delete_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_delete_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_batch_202_json_resp) do
    [batch_id: :integer]
  end

  def __fields__(:course_learner_crud_update_batch_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_batch_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_batch_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_learner_crud_update_batch_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_module_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_referencing_section_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:course_section_crud_list_405_json_resp) do
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
