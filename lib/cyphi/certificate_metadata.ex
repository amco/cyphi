defmodule Cyphi.CertificateMetadata do
  @moduledoc """
  Provides struct and type for a CertificateMetadata
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          creator_id: integer | nil,
          language: String.t() | nil,
          scope: String.t() | nil,
          scope_id: integer | nil
        }

  defstruct [:created_at, :creator_id, :language, :scope, :scope_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      creator_id: :integer,
      language: :string,
      scope: :string,
      scope_id: :integer
    ]
  end
end
