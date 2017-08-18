defmodule MezzeyTest do
  use ExUnit.Case
  doctest Mezzey

  test "greets the world" do
    assert Mezzey.hello() == :world
  end
end
