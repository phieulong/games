defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """

  @doc """
  Hello world.

  ## Examples

  iex> Games.hello()
  :world

  """
  def main(args) do
    {opts, _word, _errors} = OptionParser.parse(args, switches: [time: :string])
    Games.Wordle.play()
    IO.puts("Good #{opts[:time] || "morning"}!")
  end
end
