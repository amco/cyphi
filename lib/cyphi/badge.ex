defmodule Cyphi.Badge do
  @moduledoc """
  Provides struct and type for a Badge
  """

  @type t :: %__MODULE__{
          description: String.t(),
          id: integer | nil,
          metadata: Cyphi.BadgeMetadata.t() | nil,
          name: String.t(),
          tags: [String.t()] | nil
        }

  defstruct [:description, :id, :metadata, :name, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      id: :integer,
      metadata: {Cyphi.BadgeMetadata, :t},
      name: :string,
      tags: [:string]
    ]
  end
end
