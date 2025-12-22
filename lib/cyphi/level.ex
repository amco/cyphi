defmodule Cyphi.Level do
  @moduledoc """
  Provides struct and type for a Level
  """

  @type t :: %__MODULE__{id: integer | nil, name: String.t(), points: integer}

  defstruct [:id, :name, :points]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, name: :string, points: :integer]
  end
end
