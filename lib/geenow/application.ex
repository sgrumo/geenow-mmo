defmodule Geenow.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GeenowWeb.Telemetry,
      Geenow.Repo,
      {DNSCluster, query: Application.get_env(:geenow, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Geenow.PubSub},
      # Start a worker by calling: Geenow.Worker.start_link(arg)
      # {Geenow.Worker, arg},
      # Start to serve requests, typically the last entry
      GeenowWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Geenow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GeenowWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
