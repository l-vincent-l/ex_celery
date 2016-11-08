defmodule ExCelery.Supervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      worker(ExCelery, [], restart: :permanent)
    ]

    supervise(children, strategy: :one_for_one)
  end

end
