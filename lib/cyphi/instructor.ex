defmodule Cyphi.Instructor do
  @moduledoc """
  Provides struct and type for a Instructor
  """

  @type t :: %__MODULE__{
          coinstructor: boolean | nil,
          course: map | nil,
          course_id: integer | nil,
          id: integer | nil,
          last_visited_at: DateTime.t() | nil,
          user: map | nil,
          user_id: integer
        }

  defstruct [:coinstructor, :course, :course_id, :id, :last_visited_at, :user, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coinstructor: :boolean,
      course: :map,
      course_id: :integer,
      id: :integer,
      last_visited_at: {:string, "date-time"},
      user: :map,
      user_id: :integer
    ]
  end
end
