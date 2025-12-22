defmodule Cyphi.BadgeHistory do
  @moduledoc """
  Provides struct and type for a BadgeHistory
  """

  @type t :: %__MODULE__{awarded_at: DateTime.t() | nil, badge_id: integer, id: integer | nil}

  defstruct [:awarded_at, :badge_id, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [awarded_at: {:string, "date-time"}, badge_id: :integer, id: :integer]
  end
end
