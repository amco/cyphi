defmodule Cyphi.Assistant do
  @moduledoc """
  Provides struct and type for a Assistant
  """

  @type t :: %__MODULE__{
          course_id: integer | nil,
          id: integer | nil,
          last_visited_at: DateTime.t() | nil,
          user_id: integer
        }

  defstruct [:course_id, :id, :last_visited_at, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      course_id: :integer,
      id: :integer,
      last_visited_at: {:string, "date-time"},
      user_id: :integer
    ]
  end
end
