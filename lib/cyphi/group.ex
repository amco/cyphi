defmodule Cyphi.Group do
  @moduledoc """
  Provides struct and types for a Group
  """

  @type t :: %__MODULE__{
          access_code: String.t() | nil,
          container_id: integer | nil,
          container_type: String.t() | nil,
          description: String.t() | nil,
          display_in_catalog: boolean | nil,
          id: integer | nil,
          max_members: integer | nil,
          metadata: Cyphi.GroupMetadata.t() | nil,
          name: String.t() | nil,
          private: boolean | nil,
          tags: [String.t()] | nil,
          team: boolean | nil,
          type: String.t() | nil,
          visibility: String.t() | nil
        }

  defstruct [
    :access_code,
    :container_id,
    :container_type,
    :description,
    :display_in_catalog,
    :id,
    :max_members,
    :metadata,
    :name,
    :private,
    :tags,
    :team,
    :type,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_code: :string,
      container_id: :integer,
      container_type: :string,
      description: :string,
      display_in_catalog: :boolean,
      id: :integer,
      max_members: :integer,
      metadata: {Cyphi.GroupMetadata, :t},
      name: :string,
      private: :boolean,
      tags: [:string],
      team: :boolean,
      type: :string,
      visibility: :string
    ]
  end
end
