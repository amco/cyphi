defmodule Cyphi.BatchResults do
  @moduledoc """
  Provides struct and type for a BatchResults
  """

  @type t :: %__MODULE__{
          object: String.t() | nil,
          request: String.t() | nil,
          status_code: integer | nil,
          status_message: String.t() | nil
        }

  defstruct [:object, :request, :status_code, :status_message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      object: {:string, "string"},
      request: {:string, "string"},
      status_code: {:integer, "integer"},
      status_message: {:string, "string"}
    ]
  end
end
