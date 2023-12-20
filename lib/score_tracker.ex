defmodule Games.ScoreTracker do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  @impl true
  def init(args) do
    {:ok, args}
  end

  @impl true
  def handle_call(:current_score, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add_score, amount}, state) do
    {:noreply, state + amount}
  end
end
