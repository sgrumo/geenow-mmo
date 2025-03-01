# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :geenow,
  ecto_repos: [Geenow.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :geenow, GeenowWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: GeenowWeb.ErrorJSON],
    layout: false
  ],
  check_origin: false,
  pubsub_server: Geenow.PubSub,
  live_view: [signing_salt: "V3w6IClK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :geenow, Geenow.Auth.Guardian,
  issuer: "geenow",
  secret_key: "30HSwyRzy6OOBf+EBhSPRBktsipurTbYy6zVBsBBYtiEClmgbgzC6WQtCjFo0OVE",
  ttl: {30, :days}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
