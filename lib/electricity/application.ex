defmodule Electricity.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElectricityWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:electricity, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Electricity.PubSub},
      ElectricityReadingAgent,
      # Start the Finch HTTP client for sending emails
      {Finch, name: Electricity.Finch},
      # Start a worker by calling: Electricity.Worker.start_link(arg)
      # {Electricity.Worker, arg},
      # Start to serve requests, typically the last entry
      ElectricityWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Electricity.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElectricityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
