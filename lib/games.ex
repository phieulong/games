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
    Games.ScoreTracker.start_link()

    case IO.gets("
What game would you like to play?
1. Guessing Game
2. Rock Paper Scissors
3. Wordle

enter \"stop\" to exit
enter \"score\" to view your current score\n") |> String.downcase() |> String.replace("\n", "") do
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

      "score" ->
        IO.puts("=========================")
        IO.puts("Your score is #{Games.Score.current_score()}")
        IO.puts("=========================")
        play()

      "stop" ->
        true

      _ ->
        IO.puts("invalid choice. Choice again")
        play()
    end
  end
end
