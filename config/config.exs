# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :prioritize_api,
  ecto_repos: [PrioritizeApi.Repo]

# Configures the endpoint
config :prioritize_api, PrioritizeApi.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "ZF9Nw6RULqj3QTsahrVF0iv098dER3JJhycgmXnuM62TvgSsWavmRfyelgJ8sRbk",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: PrioritizeApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
