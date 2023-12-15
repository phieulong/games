defmodule Games.RockPaperScissors do
  @moduledoc false

  def play do
    options = ["rock", "paper", "scissors"]
    win_condition = [{"rock", "scissors"}, {"scissors", "paper"}, {"paper", "rock"}]
    rand = Enum.random(options)
    is_continue(rand, options, win_condition)
  end

  defp is_continue(rand, options, win_condition) do
    messages = "(#{Enum.join(options, "\\")}): "

    player_choice =
      IO.gets(messages)
      |> String.replace("\n", "")
      |> String.trim()
      |> String.downcase()

    cond do
      {player_choice, rand} in win_condition ->
        IO.puts("You win! #{player_choice} beats #{rand}.!")

      {rand, player_choice} in win_condition ->
        IO.puts("You lose! #{rand} beats #{player_choice}.")

      true ->
        IO.puts("It's a tie!")
    end
  end
end
