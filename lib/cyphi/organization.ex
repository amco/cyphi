defmodule Cyphi.Organization do
  @moduledoc """
  Provides struct and types for a Organization
  """

  @type t :: %__MODULE__{
          custom_fields: map | nil,
          description: String.t() | nil,
          id: integer | nil,
          internal: boolean | nil,
          name: String.t() | nil,
          parent_id: integer | nil,
          tags: [String.t()] | nil
        }

  defstruct [:custom_fields, :description, :id, :internal, :name, :parent_id, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_fields: :map,
      description: :string,
      id: :integer,
      internal: :boolean,
      name: :string,
      parent_id: :integer,
      tags: [:string]
    ]
  end
end
