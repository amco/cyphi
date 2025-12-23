defmodule Cyphi.Client.CasterTest do
  use ExUnit.Case, async: true

  alias Cyphi.Client.Caster

  describe "cast/2 simple types" do
    test "passes through nil regardless of type" do
      assert Caster.cast(nil, :integer) == nil
      assert Caster.cast(nil, :string) == nil
      assert Caster.cast(nil, {:string, "date-time"}) == nil
    end

    test "casts valid integers" do
      assert Caster.cast(123, :integer) == 123
    end

    test "casts valid booleans" do
      assert Caster.cast(true, :boolean) == true
      assert Caster.cast(false, :boolean) == false
    end

    test "casts valid strings" do
      assert Caster.cast("hello", :string) == "hello"
    end

    test "casts valid numbers (generic)" do
      assert Caster.cast(10, {:number, :any}) == 10
      assert Caster.cast(10.5, {:number, :float}) == 10.5
    end
  end

  describe "cast/2 date-time" do
    test "converts valid ISO8601 string to DateTime struct" do
      input = "2023-10-05T14:30:00Z"
      result = Caster.cast(input, {:string, "date-time"})

      assert %DateTime{} = result
      assert result.year == 2023
      assert result.month == 10
      assert result.day == 5
    end

    test "returns nil for invalid date strings (soft failure)" do
      assert Caster.cast("not a date" , {:string, "date-time"}) == nil
      assert Caster.cast("00-01-01 10:22:00" , {:string, "date-time"}) == nil
    end
  end

  describe "cast/2 fallbacks" do
    test "returns raw value when type does not match guard" do
      assert Caster.cast("123", :integer) == "123"
    end

    test "returns raw value for unknown types" do
      assert Caster.cast(:some_data, :unknown_type) == :some_data
    end
  end
end
