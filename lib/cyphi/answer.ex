defmodule Cyphi.Answer do
  @moduledoc """
  Provides struct and type for a Answer
  """

  @type t :: %__MODULE__{
          grade: String.t() | nil,
          grade_id: integer | nil,
          id: integer | nil,
          points: number | nil,
          position: integer | nil,
          question_id: integer | nil,
          response: String.t() | nil,
          score: number | nil,
          user_id: integer | nil
        }

  defstruct [
    :grade,
    :grade_id,
    :id,
    :points,
    :position,
    :question_id,
    :response,
    :score,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      grade: :string,
      grade_id: :integer,
      id: :integer,
      points: {:number, "float"},
      position: :integer,
      question_id: :integer,
      response: :string,
      score: {:number, "float"},
      user_id: :integer
    ]
  end
end
