defmodule Cyphi.Assessment do
  @moduledoc """
  Provides struct and type for a Assessment
  """

  @type t :: %__MODULE__{
          begin_at: DateTime.t() | nil,
          category: String.t() | nil,
          course_id: integer,
          creator_id: integer | nil,
          end_at: DateTime.t() | nil,
          given: boolean | nil,
          given_at: DateTime.t() | nil,
          grading: String.t() | nil,
          id: integer | nil,
          module_id: integer | nil,
          module_name: String.t() | nil,
          name: String.t() | nil,
          points: number | nil,
          type: String.t() | nil,
          use_results: String.t() | nil
        }

  defstruct [
    :begin_at,
    :category,
    :course_id,
    :creator_id,
    :end_at,
    :given,
    :given_at,
    :grading,
    :id,
    :module_id,
    :module_name,
    :name,
    :points,
    :type,
    :use_results
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      begin_at: {:string, "date-time"},
      category: :string,
      course_id: :integer,
      creator_id: :integer,
      end_at: {:string, "date-time"},
      given: :boolean,
      given_at: {:string, "date-time"},
      grading: :string,
      id: :integer,
      module_id: :integer,
      module_name: :string,
      name: :string,
      points: {:number, "float"},
      type: :string,
      use_results: :string
    ]
  end
end
