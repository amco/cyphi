defmodule Cyphi.CourseMetadata do
  @moduledoc """
  Provides struct and types for a CourseMetadata
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          creator_id: integer | nil,
          language: String.t() | nil
        }

  defstruct [:created_at, :creator_id, :language]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created_at: {:string, "date-time"}, creator_id: :integer, language: :string]
  end
end
