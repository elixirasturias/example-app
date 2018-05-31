# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :example_app,
  ecto_repos: [ExampleApp.Repo]

# Configures the endpoint
config :example_app, ExampleAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VvoE2ECdd7kSgKnMrbxl3qyBCO9kPPOcu7daljna798IkCNeD9rn13GcdZ3o9vG1",
  render_errors: [view: ExampleAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExampleApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
