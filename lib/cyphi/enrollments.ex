defmodule Cyphi.Enrollments do
  @moduledoc """
  Provides API endpoints related to enrollments
  """

  @default_client Cyphi.Client

  @type course_learner_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get learner

  Return a course learner.

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course, progress, enrolled_by, unenrolled_by, deactivated_by, reactivated_by, transferred_by, transferred_from, transferred_to, order_item.

  """
  @spec course_learner_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Learner.t()}
          | {:error,
             Cyphi.Enrollments.course_learner_crud_get_400_json_resp()
             | Cyphi.Enrollments.course_learner_crud_get_403_json_resp()
             | Cyphi.Enrollments.course_learner_crud_get_404_json_resp()
             | Cyphi.Enrollments.course_learner_crud_get_405_json_resp()}
  def course_learner_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Enrollments, :course_learner_crud_get},
      url: "/course_learners/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Learner, :t}},
        {400, {Cyphi.Enrollments, :course_learner_crud_get_400_json_resp}},
        {403, {Cyphi.Enrollments, :course_learner_crud_get_403_json_resp}},
        {404, {Cyphi.Enrollments, :course_learner_crud_get_404_json_resp}},
        {405, {Cyphi.Enrollments, :course_learner_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type course_learner_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type course_learner_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List learners

  Return a list of course learners.

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, course_id, id, enrolled_at, started, started_at, completed, completed_at, completed_by_id, unenrolled (default: false), unenrolled_at, deactivated, deactivated_at, reactivated_at, transferred, transferred_at, course_archived (default: false), user_archived (default: false), last_visited_at.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, course, progress, enrolled_by, unenrolled_by, deactivated_by, reactivated_by, transferred_by, transferred_from, transferred_to, order_item.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec course_learner_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Learner.t()]}
          | {:error,
             Cyphi.Enrollments.course_learner_crud_list_400_json_resp()
             | Cyphi.Enrollments.course_learner_crud_list_403_json_resp()
             | Cyphi.Enrollments.course_learner_crud_list_404_json_resp()
             | Cyphi.Enrollments.course_learner_crud_list_405_json_resp()}
  def course_learner_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [],
      call: {Cyphi.Enrollments, :course_learner_crud_list},
      url: "/course_learners",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Learner, :t}]},
        {400, {Cyphi.Enrollments, :course_learner_crud_list_400_json_resp}},
        {403, {Cyphi.Enrollments, :course_learner_crud_list_403_json_resp}},
        {404, {Cyphi.Enrollments, :course_learner_crud_list_404_json_resp}},
        {405, {Cyphi.Enrollments, :course_learner_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
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
end
