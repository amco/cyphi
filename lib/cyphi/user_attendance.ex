defmodule Cyphi.UserAttendance do
  @moduledoc """
  Provides struct and types for a UserAttendance
  """

  @type t :: %__MODULE__{
          arrived_late: integer | nil,
          excused: boolean | nil,
          id: integer | nil,
          left_early: integer | nil,
          note: String.t() | nil,
          status: String.t() | nil,
          user_id: integer
        }

  defstruct [:arrived_late, :excused, :id, :left_early, :note, :status, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      arrived_late: :integer,
      excused: :boolean,
      id: :integer,
      left_early: :integer,
      note: :string,
      status: :string,
      user_id: :integer
    ]
  end
end
