defmodule MongodbTestTest do
  use ExUnit.Case
  doctest MongodbTest

  test "greets the world" do
    assert MongodbTest.hello() == :world
  end
end
