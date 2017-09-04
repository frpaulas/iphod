# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :iphod,
  ecto_repos: [Iphod.Repo]

# Configures the endpoint
config :iphod, Iphod.Endpoint,
  instrumenters: [Appsignal.Phoenix.Instrumenter],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost",
        scheme: "http",
        port: {:system, "PORT"}
      ],
  # secret_key_base: "supersecretlongkey",
  # to generate a super secret long key: `mix phoenix.gen.secret`
  secret_key_base: {:system, "KEY"},
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Iphod.PubSub,
           adapter: Phoenix.PubSub.PG2
          ]

import_config "#{Mix.env}.exs"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# for automagic running of tests
# `$> mix test.watch`

if Mix.env == :dev do
  config :mix_test_watch,
    clear: true,
    tasks: ~w(test dogma)
end

# Configure phoenix generators
config :phoenix, :generators,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine,
  migration: true,
  binary_id: false

config :iphod, Iphod.Gettext, default_locale: "en"

import_config "appsignal.exs"
