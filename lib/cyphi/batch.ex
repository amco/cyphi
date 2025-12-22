defmodule Cyphi.Batch do
  @moduledoc """
  Provides struct and type for a Batch
  """

  @type t :: %__MODULE__{
          api_key_id: integer | nil,
          created_at: DateTime.t() | nil,
          failed: integer | nil,
          finished_at: DateTime.t() | nil,
          http_method: String.t() | nil,
          id: integer | nil,
          options: String.t() | nil,
          processed: integer | nil,
          request: String.t() | nil,
          results: [Cyphi.BatchResults.t()] | nil,
          started_at: DateTime.t() | nil,
          status: String.t() | nil,
          successful: integer | nil,
          uri: String.t() | nil,
          user_id: integer
        }

  defstruct [
    :api_key_id,
    :created_at,
    :failed,
    :finished_at,
    :http_method,
    :id,
    :options,
    :processed,
    :request,
    :results,
    :started_at,
    :status,
    :successful,
    :uri,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :integer,
      created_at: {:string, "date-time"},
      failed: :integer,
      finished_at: {:string, "date-time"},
      http_method: :string,
      id: :integer,
      options: :string,
      processed: :integer,
      request: :string,
      results: [{Cyphi.BatchResults, :t}],
      started_at: {:string, "date-time"},
      status: :string,
      successful: :integer,
      uri: :string,
      user_id: :integer
    ]
  end
end
