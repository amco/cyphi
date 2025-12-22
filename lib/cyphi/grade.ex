defmodule Cyphi.Grade do
  @moduledoc """
  Provides struct and types for a Grade
  """

  @type t :: %__MODULE__{
          absent: boolean | nil,
          assessment_id: integer | nil,
          course_id: String.t() | nil,
          excused: boolean | nil,
          excused_comment: String.t() | nil,
          finished: boolean | nil,
          finished_at: DateTime.t() | nil,
          fully_graded: boolean | nil,
          grade: String.t() | nil,
          graded: integer | nil,
          graded_at: DateTime.t() | nil,
          grader_id: integer | nil,
          id: integer | nil,
          incomplete: boolean | nil,
          instructor_comment: String.t() | nil,
          min_points: number | nil,
          missing: boolean | nil,
          module_id: String.t() | nil,
          module_name: String.t() | nil,
          percent: String.t() | nil,
          points: number | nil,
          score: number | nil,
          started: boolean | nil,
          started_at: DateTime.t() | nil,
          user_id: integer | nil
        }

  defstruct [
    :absent,
    :assessment_id,
    :course_id,
    :excused,
    :excused_comment,
    :finished,
    :finished_at,
    :fully_graded,
    :grade,
    :graded,
    :graded_at,
    :grader_id,
    :id,
    :incomplete,
    :instructor_comment,
    :min_points,
    :missing,
    :module_id,
    :module_name,
    :percent,
    :points,
    :score,
    :started,
    :started_at,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      absent: :boolean,
      assessment_id: :integer,
      course_id: :string,
      excused: :boolean,
      excused_comment: :string,
      finished: :boolean,
      finished_at: {:string, "date-time"},
      fully_graded: :boolean,
      grade: :string,
      graded: :integer,
      graded_at: {:string, "date-time"},
      grader_id: :integer,
      id: :integer,
      incomplete: :boolean,
      instructor_comment: :string,
      min_points: {:number, "float"},
      missing: :boolean,
      module_id: :string,
      module_name: :string,
      percent: :string,
      points: {:number, "float"},
      score: {:number, "float"},
      started: :boolean,
      started_at: {:string, "date-time"},
      user_id: :integer
    ]
  end
end
