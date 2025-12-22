defmodule Cyphi.Games do
  @moduledoc """
  Provides API endpoints related to games
  """

  @default_client Cyphi.Client

  @type game_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type game_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type game_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type game_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get game

  <p>
    Return the game with the specified ID.
  </p>
  """
  @spec game_crud_get(id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Game.t()}
          | {:error,
             Cyphi.Games.game_crud_get_400_json_resp()
             | Cyphi.Games.game_crud_get_403_json_resp()
             | Cyphi.Games.game_crud_get_404_json_resp()
             | Cyphi.Games.game_crud_get_405_json_resp()}
  def game_crud_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Cyphi.Games, :game_crud_get},
      url: "/games/#{id}",
      method: :get,
      response: [
        {200, {Cyphi.Game, :t}},
        {400, {Cyphi.Games, :game_crud_get_400_json_resp}},
        {403, {Cyphi.Games, :game_crud_get_403_json_resp}},
        {404, {Cyphi.Games, :game_crud_get_404_json_resp}},
        {405, {Cyphi.Games, :game_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type game_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type game_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type game_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type game_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List games

  <p>
    Return a list of games. You can provide one or more optional filters. Currently this operation only returns games
    that are site-wide; future versions may include a way to specify the scope such as games for courses.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.
    * `$order`: Comma separated attribute names to sort by, taken from this list: id, name. Add :desc to the end of an attribute name for descending order. This cannot be used with the $after parameter.

  """
  @spec game_crud_list(opts :: keyword) ::
          {:ok, [Cyphi.Game.t()]}
          | {:error,
             Cyphi.Games.game_crud_list_400_json_resp()
             | Cyphi.Games.game_crud_list_403_json_resp()
             | Cyphi.Games.game_crud_list_404_json_resp()
             | Cyphi.Games.game_crud_list_405_json_resp()}
  def game_crud_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset", :"$order"])

    client.request(%{
      args: [],
      call: {Cyphi.Games, :game_crud_list},
      url: "/games",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Game, :t}]},
        {400, {Cyphi.Games, :game_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :game_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :game_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :game_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type game_level_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get level

  <p>
    Return the game level with the specified ID.
  </p>
  """
  @spec game_level_crud_get(id :: integer, level_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Level.t()}
          | {:error,
             Cyphi.Games.game_level_crud_get_400_json_resp()
             | Cyphi.Games.game_level_crud_get_403_json_resp()
             | Cyphi.Games.game_level_crud_get_404_json_resp()
             | Cyphi.Games.game_level_crud_get_405_json_resp()}
  def game_level_crud_get(id, level_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, level_id: level_id],
      call: {Cyphi.Games, :game_level_crud_get},
      url: "/games/#{id}/levels/#{level_id}",
      method: :get,
      response: [
        {200, {Cyphi.Level, :t}},
        {400, {Cyphi.Games, :game_level_crud_get_400_json_resp}},
        {403, {Cyphi.Games, :game_level_crud_get_403_json_resp}},
        {404, {Cyphi.Games, :game_level_crud_get_404_json_resp}},
        {405, {Cyphi.Games, :game_level_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type game_level_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type game_level_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List levels

  <p>
    Return a list of game levels.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id, name.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec game_level_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Level.t()]}
          | {:error,
             Cyphi.Games.game_level_crud_list_400_json_resp()
             | Cyphi.Games.game_level_crud_list_403_json_resp()
             | Cyphi.Games.game_level_crud_list_404_json_resp()
             | Cyphi.Games.game_level_crud_list_405_json_resp()}
  def game_level_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Games, :game_level_crud_list},
      url: "/games/#{id}/levels",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Level, :t}]},
        {400, {Cyphi.Games, :game_level_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :game_level_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :game_level_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :game_level_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type game_player_crud_get_400_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_get_403_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_get_404_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_get_405_json_resp :: %{message: String.t() | nil}

  @doc """
  Get player

  <p>
    Return the player with the specified ID. Note that this does not return a user object, it returns
    a player record that include the user_id. You can use $include=user if you want to get the user
    object as well.
  </p>

  <p>
    Note that the points field indicates the total number of points that the player currently has and
    their current level. There are additional methods for getting the history of the player's points,
    badges, and level achievements.
  </p>

  ## Options

    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.

  """
  @spec game_player_crud_get(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, Cyphi.Player.t()}
          | {:error,
             Cyphi.Games.game_player_crud_get_400_json_resp()
             | Cyphi.Games.game_player_crud_get_403_json_resp()
             | Cyphi.Games.game_player_crud_get_404_json_resp()
             | Cyphi.Games.game_player_crud_get_405_json_resp()}
  def game_player_crud_get(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$include"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Games, :game_player_crud_get},
      url: "/games/#{id}/players/#{user_id}",
      method: :get,
      query: query,
      response: [
        {200, {Cyphi.Player, :t}},
        {400, {Cyphi.Games, :game_player_crud_get_400_json_resp}},
        {403, {Cyphi.Games, :game_player_crud_get_403_json_resp}},
        {404, {Cyphi.Games, :game_player_crud_get_404_json_resp}},
        {405, {Cyphi.Games, :game_player_crud_get_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type game_player_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type game_player_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List players

  <p>
    Return a list of the players in the game with the specified ID.
    Note that this does not return user objects, it returns their player records that include the user_id.
    You can use $include=user if you want to get the user object as well.
  </p>

  <p>
    Note also that the points field indicates the total number of points that the player currently has and
    their current level. There are additional methods for getting the history of the player's points,
    badges, and level achievements.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: user_id, id, id, name.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: user.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec game_player_crud_list(id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.Player.t()]}
          | {:error,
             Cyphi.Games.game_player_crud_list_400_json_resp()
             | Cyphi.Games.game_player_crud_list_403_json_resp()
             | Cyphi.Games.game_player_crud_list_404_json_resp()
             | Cyphi.Games.game_player_crud_list_405_json_resp()}
  def game_player_crud_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id],
      call: {Cyphi.Games, :game_player_crud_list},
      url: "/games/#{id}/players",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.Player, :t}]},
        {400, {Cyphi.Games, :game_player_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :game_player_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :game_player_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :game_player_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type player_badge_history_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type player_badge_history_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type player_badge_history_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type player_badge_history_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List player's badge history

  <p>
    Return a list of the specified player's badge history.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: badge.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec player_badge_history_crud_list(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.BadgeHistory.t()]}
          | {:error,
             Cyphi.Games.player_badge_history_crud_list_400_json_resp()
             | Cyphi.Games.player_badge_history_crud_list_403_json_resp()
             | Cyphi.Games.player_badge_history_crud_list_404_json_resp()
             | Cyphi.Games.player_badge_history_crud_list_405_json_resp()}
  def player_badge_history_crud_list(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Games, :player_badge_history_crud_list},
      url: "/games/#{id}/players/#{user_id}/badge_history",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.BadgeHistory, :t}]},
        {400, {Cyphi.Games, :player_badge_history_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :player_badge_history_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :player_badge_history_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :player_badge_history_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type player_level_history_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type player_level_history_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type player_level_history_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type player_level_history_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List player's level history

  <p>
    Return a list of the specified player's level history.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id.
    * `$include`: Comma separated list of relationships to include in the results, taken from this list: level.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec player_level_history_crud_list(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.LevelHistory.t()]}
          | {:error,
             Cyphi.Games.player_level_history_crud_list_400_json_resp()
             | Cyphi.Games.player_level_history_crud_list_403_json_resp()
             | Cyphi.Games.player_level_history_crud_list_404_json_resp()
             | Cyphi.Games.player_level_history_crud_list_405_json_resp()}
  def player_level_history_crud_list(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$include", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Games, :player_level_history_crud_list},
      url: "/games/#{id}/players/#{user_id}/level_history",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.LevelHistory, :t}]},
        {400, {Cyphi.Games, :player_level_history_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :player_level_history_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :player_level_history_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :player_level_history_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @type player_point_history_crud_list_400_json_resp :: %{message: String.t() | nil}

  @type player_point_history_crud_list_403_json_resp :: %{message: String.t() | nil}

  @type player_point_history_crud_list_404_json_resp :: %{message: String.t() | nil}

  @type player_point_history_crud_list_405_json_resp :: %{message: String.t() | nil}

  @doc """
  List player's point history

  <p>
    Return a list of the specified player's point history.
  </p>

  ## Options

    * `$after`: Used for fast paging by setting the value to the last object id. This cannot be used with the $order parameter.
    * `$count`: If true, just return the number of list items in the form {'count' : number}.
    * `$filter`: Filter using JSON structure, with attributes taken from this list: id.
    * `$limit`: Limit the number of returned objects. The default is 10, the maximum is 100.
    * `$offset`: Used for paging through a small dataset, and it can be used with the $order parameter. This cannot be used with the $after parameter.

  """
  @spec player_point_history_crud_list(id :: integer, user_id :: integer, opts :: keyword) ::
          {:ok, [Cyphi.PointHistory.t()]}
          | {:error,
             Cyphi.Games.player_point_history_crud_list_400_json_resp()
             | Cyphi.Games.player_point_history_crud_list_403_json_resp()
             | Cyphi.Games.player_point_history_crud_list_404_json_resp()
             | Cyphi.Games.player_point_history_crud_list_405_json_resp()}
  def player_point_history_crud_list(id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"$after", :"$count", :"$filter", :"$limit", :"$offset"])

    client.request(%{
      args: [id: id, user_id: user_id],
      call: {Cyphi.Games, :player_point_history_crud_list},
      url: "/games/#{id}/players/#{user_id}/point_history",
      method: :get,
      query: query,
      response: [
        {200, [{Cyphi.PointHistory, :t}]},
        {400, {Cyphi.Games, :player_point_history_crud_list_400_json_resp}},
        {403, {Cyphi.Games, :player_point_history_crud_list_403_json_resp}},
        {404, {Cyphi.Games, :player_point_history_crud_list_404_json_resp}},
        {405, {Cyphi.Games, :player_point_history_crud_list_405_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:game_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_level_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_get_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_get_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_get_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_get_405_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:game_player_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:player_badge_history_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:player_badge_history_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:player_badge_history_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:player_badge_history_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:player_level_history_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:player_level_history_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:player_level_history_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:player_level_history_crud_list_405_json_resp) do
    [message: :string]
  end

  def __fields__(:player_point_history_crud_list_400_json_resp) do
    [message: :string]
  end

  def __fields__(:player_point_history_crud_list_403_json_resp) do
    [message: :string]
  end

  def __fields__(:player_point_history_crud_list_404_json_resp) do
    [message: :string]
  end

  def __fields__(:player_point_history_crud_list_405_json_resp) do
    [message: :string]
  end
end
