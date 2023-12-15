defmodule Games.Wordle do
  @moduledoc """
  Word play
  """

  @doc """
  iex> Games.Wordle.feedback("aaaaa", "aaaaa")
  [:green, :green, :green, :green, :green]

  iex> Games.Wordle.feedback("aaaaa", "aaaab")
  [:green, :green, :green, :green, :grey]

  iex> Games.Wordle.feedback("abdce", "edcba")
  [:yellow, :yellow, :yellow, :yellow, :yellow]

  # If There Are Duplicate Characters In The Guess Prioritize Exact Matches.
  iex> Games.Wordle.feedback("aaabb", "xaaaa")
  [:grey, :green, :green, :yellow, :grey]
  """
  def play() do
    rand = Enum.random(["toast", "tarts", "hello", "beats"])

    rs =
      feedback(rand, IO.gets("input: "))
      |> Enum.map(fn e ->
        case e do
          :green ->
            IO.ANSI.green() <> "green" <> IO.ANSI.reset()

          :yellow ->
            IO.ANSI.yellow() <> "yellow" <> IO.ANSI.reset()

          :grey ->
            IO.ANSI.light_black() <> "grey" <> IO.ANSI.reset()
        end
      end)
      |> Enum.join(", ")

    IO.puts("[#{rs}]")
  end

  def feedback(answer, guess) do
    answer_chars = String.codepoints(answer)
    guess_chars = String.codepoints(guess)

    Enum.zip(answer_chars, guess_chars)
    |> Enum.reduce([], fn {ac, gc}, acc ->
      index = length(acc) - 1
      gc_before = String.at(guess, index)

      List.insert_at(
        acc,
        length(acc),
        cond do
          gc == ac ->
            :green

          index > 0 && gc_before == gc && Enum.at(acc, index) == :yellow ->
            :grey

          gc in answer_chars ->
            :yellow

          true ->
            :grey
        end
      )
    end)
  end
end
