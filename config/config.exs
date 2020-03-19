# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :menu_card,
  ecto_repos: [MenuCard.Repo]

# Configures the endpoint
config :menu_card, MenuCardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yF1d+74T9qE0C5rdhg4waLNsoaT6McOrnBntsdtRekY4vlXE+Z2/C9Me4opmkJOf",
  render_errors: [view: MenuCardWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MenuCard.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "wtpo+QJY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
