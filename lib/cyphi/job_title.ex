defmodule Cyphi.JobTitle do
  @moduledoc """
  Provides struct and types for a JobTitle
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [:description, :id, :name, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, id: :integer, name: :string, tags: [:string]]
  end
end
