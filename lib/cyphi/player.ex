defmodule Cyphi.Player do
  @moduledoc """
  Provides struct and type for a Player
  """

  @type t :: %__MODULE__{
          id: integer | nil,
          level: Cyphi.PlayerLevel.t() | nil,
          points: integer | nil,
          user_id: integer
        }

  defstruct [:id, :level, :points, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, level: {Cyphi.PlayerLevel, :t}, points: :integer, user_id: :integer]
  end
end
