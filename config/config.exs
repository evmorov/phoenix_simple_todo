# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_simple_todo,
  ecto_repos: [PhoenixSimpleTodo.Repo]

# Configures the endpoint
config :phoenix_simple_todo, PhoenixSimpleTodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WrdgMVBm9FbtEgtacvLe94Zob+km80muui08ZH4ofIGd4YELNWGa9F55tCOzj/aT",
  render_errors: [view: PhoenixSimpleTodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixSimpleTodo.PubSub,
  live_view: [signing_salt: "MlieuyqP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
