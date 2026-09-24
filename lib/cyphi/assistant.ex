defmodule Cyphi.Assistant do
  @moduledoc """
  Provides struct and type for a Assistant
  """

  @type t :: %__MODULE__{
          course: map | nil,
          course_id: integer | nil,
          id: integer | nil,
          last_visited_at: DateTime.t() | nil,
          user: map | nil,
          user_id: integer
        }

  defstruct [:course, :course_id, :id, :last_visited_at, :user, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      course: :map,
      course_id: :integer,
      id: :integer,
      last_visited_at: {:string, "date-time"},
      user: :map,
      user_id: :integer
    ]
  end
end
