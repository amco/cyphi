defmodule Cyphi.ScormAnswer do
  @moduledoc """
  Provides struct and type for a ScormAnswer
  """

  @type t :: %__MODULE__{
          correct_answer: String.t() | nil,
          grade_id: integer | nil,
          id: integer | nil,
          position: integer | nil,
          response: String.t() | nil,
          result: String.t() | nil,
          user_id: integer | nil,
          weighting: number | nil
        }

  defstruct [:correct_answer, :grade_id, :id, :position, :response, :result, :user_id, :weighting]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      correct_answer: :string,
      grade_id: :integer,
      id: :integer,
      position: :integer,
      response: :string,
      result: :string,
      user_id: :integer,
      weighting: {:number, "float"}
    ]
  end
end
