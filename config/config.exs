# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :alexa_hello_world,
  ecto_repos: [AlexaHelloWorld.Repo]

# Configures the endpoint
config :alexa_hello_world, AlexaHelloWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dgjKVg4AgNHD5jC+47vq6gh1RDoj5p30MUpYIS+OwnQFgWH5Gu7YAIk8da5FDLsS",
  render_errors: [view: AlexaHelloWorldWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AlexaHelloWorld.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
