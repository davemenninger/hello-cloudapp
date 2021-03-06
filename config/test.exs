use Mix.Config

# Configure your database
config :hello_cloudapp, HelloCloudapp.Repo,
  username: "postgres",
  password: "postgres",
  database: "hello_cloudapp_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_cloudapp, HelloCloudappWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
