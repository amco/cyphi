defmodule Cyphi.AttendanceSession do
  @moduledoc """
  Provides struct and types for a AttendanceSession
  """

  @type t :: %__MODULE__{
          finished_at: DateTime.t() | nil,
          id: integer | nil,
          started_at: DateTime.t() | nil
        }

  defstruct [:finished_at, :id, :started_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [finished_at: {:string, "date-time"}, id: :integer, started_at: {:string, "date-time"}]
  end
end
