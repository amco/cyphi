defmodule Cyphi.Client.Caster do
  @moduledoc false

  def cast(nil, _), do: nil

  def cast(value, :integer) when is_integer(value), do: value
  def cast(value, :boolean) when is_boolean(value), do: value
  def cast(value, :string) when is_binary(value), do: value
  def cast(value, {:number, _}) when is_number(value), do: value

  def cast(value, {:string, "date-time"}) when is_binary(value) do
    case DateTime.from_iso8601(value) do
      {:ok, datetime, _} -> datetime
      _ -> nil
    end
  end

  def cast(value, _), do: value
end
