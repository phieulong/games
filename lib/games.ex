defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """
  alias Games.Wordle
  alias Games.RockPaperScissors
  alias Games.GuessingGame

  @doc """
  Hello world.

  ## Examples

  iex> Games.hello()
  :world

  """
  def main(_args) do
    play()
  end

  def play() do
    case IO.gets("
What game would you like to play?
1. Guessing Game
2. Rock Paper Scissors
3. Wordle

enter \"stop\" to exit \n") |> String.downcase() |> String.replace("\n", "") do
      "1" ->
        IO.puts("")
        GuessingGame.play()
        IO.puts("------------------------")
        play()

      "2" ->
        IO.puts("")
        RockPaperScissors.play()
        IO.puts("------------------------")
        play()

      "3" ->
        IO.puts("")
        Wordle.play()
        IO.puts("------------------------")
        play()

      "stop" ->
        true
    end
  end
end
