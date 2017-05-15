defmodule Eeeapp.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Eeeapp.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Eeeapp.Web.Endpoint, []),
      # Start your own worker by calling: Eeeapp.Worker.start_link(arg1, arg2, arg3)
      # worker(Eeeapp.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Eeeapp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
