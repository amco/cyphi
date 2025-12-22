defmodule Cyphi.LevelHistory do
  @moduledoc """
  Provides struct and type for a LevelHistory
  """

  @type t :: %__MODULE__{awarded_at: DateTime.t() | nil, id: integer | nil, level_id: integer}

  defstruct [:awarded_at, :id, :level_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [awarded_at: {:string, "date-time"}, id: :integer, level_id: :integer]
  end
end
