defmodule Rockelivery.Stack do
  use GenServer

  # Client

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (Callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_stack = [element | state]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    new_stack = [element | state]
    {:noreply, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end
