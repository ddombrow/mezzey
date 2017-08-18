defmodule Mezzey.Application do
    use Application
    require Logger
  
    # See https://hexdocs.pm/elixir/Application.html
    # for more information on OTP Applications
    def start(_type, _args) do
  
      # Define workers and child supervisors to be supervised
      children = [
        # Start the Ecto repository
        #supervisor(CavaChallenge.Repo, []),
        # Start the endpoint when the application starts
        #supervisor(CavaChallengeWeb.Endpoint, []),
        # Start your own worker by calling: CavaChallenge.Worker.start_link(arg1, arg2, arg3)
        # worker(CavaChallenge.Worker, [arg1, arg2, arg3]),
        Plug.Adapters.Cowboy.child_spec(:http, Mezzey.Router, [], port: 9010)
      ]

      Logger.info "Started application"
  
      # See https://hexdocs.pm/elixir/Supervisor.html
      # for other strategies and supported options
      opts = [strategy: :one_for_one, name: Mezzey.Supervisor]
      Supervisor.start_link(children, opts)
    end
  
    # Tell Phoenix to update the endpoint configuration
    # whenever the application is updated.
    #def config_change(changed, _new, removed) do
    #  CavaChallengeWeb.Endpoint.config_change(changed, removed)
    #  :ok
    #end
  end