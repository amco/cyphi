defmodule Cyphi.Certificate do
  @moduledoc """
  Provides struct and type for a Certificate
  """

  @type t :: %__MODULE__{
          description: String.t(),
          id: integer | nil,
          metadata: Cyphi.CertificateMetadata.t() | nil,
          name: String.t(),
          number: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [:description, :id, :metadata, :name, :number, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      id: :integer,
      metadata: {Cyphi.CertificateMetadata, :t},
      name: :string,
      number: :string,
      tags: [:string]
    ]
  end
end
