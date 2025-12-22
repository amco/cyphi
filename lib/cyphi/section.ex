defmodule Cyphi.Section do
  @moduledoc """
  Provides struct and type for a Section
  """

  @type t :: %__MODULE__{
          id: integer | nil,
          instructions: String.t() | nil,
          level: integer | nil,
          module_id: integer | nil,
          name: String.t() | nil,
          optional_for_completion: boolean | nil,
          personalized: boolean | nil,
          position: integer | nil,
          referenced_course_id: integer | nil,
          type: String.t() | nil
        }

  defstruct [
    :id,
    :instructions,
    :level,
    :module_id,
    :name,
    :optional_for_completion,
    :personalized,
    :position,
    :referenced_course_id,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      instructions: :string,
      level: :integer,
      module_id: :integer,
      name: :string,
      optional_for_completion: :boolean,
      personalized: :boolean,
      position: :integer,
      referenced_course_id: :integer,
      type: :string
    ]
  end
end
