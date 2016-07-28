# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hub,
  namespace: BitEnvoy,
  ecto_repos: [BitEnvoy.Repo]

# Configures the endpoint
config :hub, BitEnvoy.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "at3gCcoR9ABnEX3R3/8rZWiTNcCa0LwRuXeP6jTjlpjLtbFluEcwaJyKKx1AqOGM",
  render_errors: [view: BitEnvoy.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BitEnvoy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
