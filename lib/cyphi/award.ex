defmodule Cyphi.Award do
  @moduledoc """
  Provides struct and type for a Award
  """

  @type t :: %__MODULE__{
          awarded_at: DateTime.t() | nil,
          awardee: map | nil,
          awardee_id: integer | nil,
          id: integer | nil,
          note: String.t() | nil,
          user: map | nil,
          user_id: integer
        }

  defstruct [:awarded_at, :awardee, :awardee_id, :id, :note, :user, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      awarded_at: {:string, "date-time"},
      awardee: :map,
      awardee_id: :integer,
      id: :integer,
      note: :string,
      user: :map,
      user_id: :integer
    ]
  end
end
