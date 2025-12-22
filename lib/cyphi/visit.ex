defmodule Cyphi.Visit do
  @moduledoc """
  Provides struct and type for a Visit
  """

  @type t :: %__MODULE__{
          ended_at: DateTime.t() | nil,
          id: integer | nil,
          object_name: String.t() | nil,
          object_type: String.t() | nil,
          start_url: String.t() | nil,
          started_at: DateTime.t() | nil,
          status: String.t() | nil,
          time_spent: integer | nil,
          user_agent: String.t() | nil,
          user_id: integer | nil,
          user_ip: String.t() | nil,
          user_session: String.t() | nil
        }

  defstruct [
    :ended_at,
    :id,
    :object_name,
    :object_type,
    :start_url,
    :started_at,
    :status,
    :time_spent,
    :user_agent,
    :user_id,
    :user_ip,
    :user_session
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ended_at: {:string, "date-time"},
      id: :integer,
      object_name: :string,
      object_type: :string,
      start_url: :string,
      started_at: {:string, "date-time"},
      status: :string,
      time_spent: :integer,
      user_agent: :string,
      user_id: :integer,
      user_ip: :string,
      user_session: :string
    ]
  end
end
