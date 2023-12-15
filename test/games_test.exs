defmodule GamesTest do
  use ExUnit.Case
  doctest Games

  test "greets the world" do
    assert Games.hello() == :world
  end
end

defmodule GamesWordleTest do
  use ExUnit.Case
  doctest Games.Wordle
end
