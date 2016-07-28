use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hub, BitEnvoy.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hub, BitEnvoy.Repo,
  adapter: Sqlite.Ecto,
  database: "db/hub_test.sqlite",
  pool: Ecto.Adapters.SQL.Sandbox
