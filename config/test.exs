import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :geenow, Geenow.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "geenow_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :geenow, GeenowWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "N1rJf1wHK8MDbAT0n5ZSzaLSVg71iB+PKKf/nrwQEWttEuMLTK6YlYTFKG6WF5vL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :bcrypt_elixir, :log_rounds, 1
