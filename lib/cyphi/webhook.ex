defmodule Cyphi.Webhook do
  @moduledoc """
  Provides struct and type for a Webhook
  """

  @type t :: %__MODULE__{
          event: String.t(),
          id: integer | nil,
          recipe_id: String.t() | nil,
          target_url: String.t()
        }

  defstruct [:event, :id, :recipe_id, :target_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: :string, id: :integer, recipe_id: :string, target_url: :string]
  end
end
