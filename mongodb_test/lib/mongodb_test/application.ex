defmodule MongodbTest.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Starts a worker by calling: MongodbTest.Worker.start_link(arg)
      # {MongodbTest.Worker, arg},
      worker(Mongo, [[name: :mongo, database: "test_db", pool: DBConnection.Poolboy]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MongodbTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
