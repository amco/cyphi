defmodule CyphiTest do
  use ExUnit.Case
  doctest Cyphi

  test "greets the world" do
    assert Cyphi.hello() == :world
  end
end
