defmodule Games.Score do
  def add_score(score) do
    pid = Process.whereis(Games.ScoreTracker)
    GenServer.cast(pid, {:add_score, score})
  end

  def current_score() do
    pid = Process.whereis(Games.ScoreTracker)
    GenServer.call(pid, :current_score)
  end
end
