defmodule AlexaHelloWorld.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    alexa_app_id = Application.get_env(:alexa_hello_world, AlexaHelloWorld.AlexaSkill)[:app_id]

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(AlexaHelloWorld.Repo, []),
      # Start the endpoint when the application starts
      supervisor(AlexaHelloWorldWeb.Endpoint, []),
      # Start your own worker by calling: AlexaHelloWorld.Worker.start_link(arg1, arg2, arg3)
      # worker(AlexaHelloWorld.Worker, [arg1, arg2, arg3]),


      worker(AlexaHelloWorld.AlexaSkill.Handler, [[app_id: alexa_app_id]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AlexaHelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AlexaHelloWorldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
