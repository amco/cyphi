defmodule Cyphi.Session do
  @moduledoc """
  Provides struct and type for a Session
  """

  @type t :: %__MODULE__{
          id: integer | nil,
          ip_address: String.t() | nil,
          login_at: DateTime.t() | nil,
          logout_at: DateTime.t() | nil,
          user_id: integer | nil
        }

  defstruct [:id, :ip_address, :login_at, :logout_at, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      ip_address: :string,
      login_at: {:string, "date-time"},
      logout_at: {:string, "date-time"},
      user_id: :integer
    ]
  end
end
