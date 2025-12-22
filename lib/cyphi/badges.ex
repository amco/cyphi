defmodule Cyphi.Badges do
  @moduledoc """
  Provides API endpoints related to badges
  """

  @default_client Cyphi.Client

  @type badge_award_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type badge_award_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type badge_award_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type badge_award_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List badge awards

  <p>
    Return a list of the occasions that this badge was awarded.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, id, awarded_at.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user, awardee.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec badge_award_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Award.t()]}
          | {:error,
             Cyphi.Badges.badge_award_crud_list_400_json_resp()
             | Cyphi.Badges.badge_award_crud_list_403_json_resp()
             | Cyphi.Badges.badge_award_crud_list_404_json_resp()
             | Cyphi.Badges.badge_award_crud_list_405_json_resp()}
  def badge_award_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Badges, :badge_award_crud_list},
      url: "/badges/#{id}/awards",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Award, :t}]},
        {400, {Cyphi.Badges, :badge_award_crud_list_400_json_resp}},
        {403, {Cyphi.Badges, :badge_award_crud_list_403_json_resp}},
        {404, {Cyphi.Badges, :badge_award_crud_list_404_json_resp}},
        {405, {Cyphi.Badges, :badge_award_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type badge_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type badge_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type badge_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type badge_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get badge

  <p>
    Return the badge with the specified ID.
  </p>
  """
  @spec badge_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Badge.t()}
          | {:error,
             Cyphi.Badges.badge_crud_get_400_json_resp()
             | Cyphi.Badges.badge_crud_get_403_json_resp()
             | Cyphi.Badges.badge_crud_get_404_json_resp()
             | Cyphi.Badges.badge_crud_get_405_json_resp()}
  def badge_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Badges, :badge_crud_get},
      url: "/badges/#{id}",
      method: :get,
      response: [
        {200, {Cyphi.Badge, :t}},
        {400, {Cyphi.Badges, :badge_crud_get_400_json_resp}},
        {403, {Cyphi.Badges, :badge_crud_get_403_json_resp}},
        {404, {Cyphi.Badges, :badge_crud_get_404_json_resp}},
        {405, {Cyphi.Badges, :badge_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type badge_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type badge_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type badge_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type badge_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List badges

  <p>
    Return a list of badges. You can provide one or more optional filters. Currently this operation only returns badges
    that are in the school/business library or in an organization library; future versions may include a way to specify
    the library/libraries to search.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name, tags, metadata.creator_id, metadata.created_at, metadata.language.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec badge_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Badge.t()]}
          | {:error,
             Cyphi.Badges.badge_crud_list_400_json_resp()
             | Cyphi.Badges.badge_crud_list_403_json_resp()
             | Cyphi.Badges.badge_crud_list_404_json_resp()
             | Cyphi.Badges.badge_crud_list_405_json_resp()}
  def badge_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [],
      call: {Cyphi.Badges, :badge_crud_list},
      url: "/badges",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Badge, :t}]},
        {400, {Cyphi.Badges, :badge_crud_list_400_json_resp}},
        {403, {Cyphi.Badges, :badge_crud_list_403_json_resp}},
        {404, {Cyphi.Badges, :badge_crud_list_404_json_resp}},
        {405, {Cyphi.Badges, :badge_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:badge_award_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_award_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_award_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_award_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:badge_crud_list_405_json_resp) do
    [message: :string]
  end
end
