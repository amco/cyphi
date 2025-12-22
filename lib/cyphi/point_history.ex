defmodule Cyphi.PointHistory do
  @moduledoc """
  Provides struct and type for a PointHistory
  """

  @type t :: %__MODULE__{awarded_at: DateTime.t() | nil, id: integer | nil, points: integer | nil}

  defstruct [:awarded_at, :id, :points]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [awarded_at: {:string, "date-time"}, id: :integer, points: :integer]
  end
end
