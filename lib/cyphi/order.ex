defmodule Cyphi.Order do
  @moduledoc """
  Provides struct and type for a Order
  """

  @type t :: %__MODULE__{
          bulk_discount: number | nil,
          checkout_at: DateTime.t() | nil,
          coupon_codes: String.t() | nil,
          created_at: DateTime.t() | nil,
          currency: String.t() | nil,
          id: integer | nil,
          notes: String.t() | nil,
          order_number: String.t() | nil,
          organization_id: integer | nil,
          tax_amount: number | nil,
          tax_type: String.t() | nil,
          total: String.t() | nil,
          total_without_bulk_discount: String.t() | nil,
          total_without_tax: String.t() | nil,
          user_id: integer,
          user_name: String.t() | nil,
          utm_campaign: String.t() | nil,
          utm_content: String.t() | nil,
          utm_medium: String.t() | nil,
          utm_source: String.t() | nil,
          utm_term: String.t() | nil,
          verified_at: DateTime.t() | nil,
          verifier_id: integer | nil
        }

  defstruct [
    :bulk_discount,
    :checkout_at,
    :coupon_codes,
    :created_at,
    :currency,
    :id,
    :notes,
    :order_number,
    :organization_id,
    :tax_amount,
    :tax_type,
    :total,
    :total_without_bulk_discount,
    :total_without_tax,
    :user_id,
    :user_name,
    :utm_campaign,
    :utm_content,
    :utm_medium,
    :utm_source,
    :utm_term,
    :verified_at,
    :verifier_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bulk_discount: {:number, "float"},
      checkout_at: {:string, "date-time"},
      coupon_codes: :string,
      created_at: {:string, "date-time"},
      currency: :string,
      id: :integer,
      notes: :string,
      order_number: :string,
      organization_id: :integer,
      tax_amount: {:number, "float"},
      tax_type: :string,
      total: :string,
      total_without_bulk_discount: :string,
      total_without_tax: :string,
      user_id: :integer,
      user_name: :string,
      utm_campaign: :string,
      utm_content: :string,
      utm_medium: :string,
      utm_source: :string,
      utm_term: :string,
      verified_at: {:string, "date-time"},
      verifier_id: :integer
    ]
  end
end
