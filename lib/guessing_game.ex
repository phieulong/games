defmodule Games.GuessingGame do
  def play do
    rand = Enum.random(5..10)
    is_continue(rand)
  end

  defp is_continue(rand) do
    guest_number =
      IO.gets("Guess a number between 10 and 5: ")
      |> String.replace("\n", "")
      |> String.to_integer()

    cond do
      guest_number == rand ->
        IO.puts("Correct!")

      guest_number > rand ->
        IO.puts("Too high!")
        is_continue(rand)

      guest_number < rand ->
        IO.puts("Too low!")
        is_continue(rand)
    end
  end
end
