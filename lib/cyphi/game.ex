defmodule Cyphi.Game do
  @moduledoc """
  Provides struct and type for a Game
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          game_enabled: boolean | nil,
          id: integer | nil,
          leaderboard_enabled: boolean | nil,
          name: String.t(),
          type: String.t() | nil
        }

  defstruct [:description, :game_enabled, :id, :leaderboard_enabled, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      game_enabled: :boolean,
      id: :integer,
      leaderboard_enabled: :boolean,
      name: :string,
      type: :string
    ]
  end
end
