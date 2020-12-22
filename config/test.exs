import Config

alias Bonfire.{Mailer, Repo}

config :bonfire, Mailer,
  adapter: Bamboo.TestAdapter

config :logger, level: :warn

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :bonfire, Repo,
  username: "postgres",
  password: "postgres",
  database: "bonfire_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: System.get_env("DATABASE_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bonfire, Bonfire.Web.Endpoint,
  http: [port: 4002],
  server: false

config :bonfire, Oban,
  crontab: false,
  plugins: false,
  queues: false
