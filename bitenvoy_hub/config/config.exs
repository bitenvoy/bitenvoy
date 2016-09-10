# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bitenvoy_hub,
  namespace: BitEnvoyHub,
  ecto_repos: [BitEnvoyHub.Repo]

# Configures the endpoint
config :bitenvoy_hub, BitEnvoyHub.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D9Tm1QcYylc9//u5SDvkSIsBLooinpgOx3FoC/LShQZq+1R+BQmlH9ShT88iBVwT",
  render_errors: [view: BitEnvoyHub.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BitEnvoyHub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
