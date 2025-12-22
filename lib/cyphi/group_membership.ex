defmodule Cyphi.GroupMembership do
  @moduledoc """
  Provides struct and type for a GroupMembership
  """

  @type t :: %__MODULE__{
          group_id: integer | nil,
          id: integer | nil,
          join_type: String.t() | nil,
          joined_at: DateTime.t() | nil,
          last_visited_at: DateTime.t() | nil,
          user_id: integer
        }

  defstruct [:group_id, :id, :join_type, :joined_at, :last_visited_at, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      group_id: :integer,
      id: :integer,
      join_type: :string,
      joined_at: {:string, "date-time"},
      last_visited_at: {:string, "date-time"},
      user_id: :integer
    ]
  end
end
