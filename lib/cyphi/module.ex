defmodule Cyphi.Module do
  @moduledoc """
  Provides struct and type for a Module
  """

  @type t :: %__MODULE__{
          all_day: boolean | nil,
          begin_at: DateTime.t() | nil,
          course_id: integer | nil,
          description: String.t() | nil,
          end_at: DateTime.t() | nil,
          id: integer | nil,
          location: String.t() | nil,
          name: String.t() | nil,
          notes: String.t() | nil,
          optional_for_completion: boolean | nil,
          personalized: boolean | nil,
          picture: String.t() | nil,
          position: integer | nil,
          released_at: DateTime.t() | nil,
          start_at: Date.t() | nil,
          tags: [String.t()] | nil,
          tile_color: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :all_day,
    :begin_at,
    :course_id,
    :description,
    :end_at,
    :id,
    :location,
    :name,
    :notes,
    :optional_for_completion,
    :personalized,
    :picture,
    :position,
    :released_at,
    :start_at,
    :tags,
    :tile_color,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      all_day: :boolean,
      begin_at: {:string, "date-time"},
      course_id: :integer,
      description: :string,
      end_at: {:string, "date-time"},
      id: :integer,
      location: :string,
      name: :string,
      notes: :string,
      optional_for_completion: :boolean,
      personalized: :boolean,
      picture: :string,
      position: :integer,
      released_at: {:string, "date-time"},
      start_at: {:string, "date"},
      tags: [:string],
      tile_color: :string,
      updated_at: {:string, "date-time"}
    ]
  end
end
