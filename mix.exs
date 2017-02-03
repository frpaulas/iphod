defmodule Iphod.Mixfile do
  use Mix.Project

  def project do
    [app: :iphod,
     version: "0.0.1",
     elixir: ">= 1.4.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     timex: "~> 0.13.4",
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Iphod, []},
     applications: [:phoenix, :phoenix_html, :phoenix_pubsub,
                    :phoenix_live_reload, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :timex, :httpoison,
                    :mailgun, :earmark,
                    :edeliver # keep at end!
                  ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [ {:phoenix, ">= 1.2.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:ecto, "~> 2.0.4"},
      {:phoenix_ecto, "~> 3.0.1"},
      {:phoenix_html, ">= 2.6.2"},
      {:phoenix_live_reload, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.9"},
      {:cowboy, "~> 1.0"},
      {:exrm, "~> 1.0.8", only: :prod},
      # {:timex, github: "frpaulas/timex"},
      {:timex, "~> 3.1.8"},
      {:httpoison, "~> 0.11.0"},
      {:mailgun, "~> 0.1.2"},
      {:earmark, "~> 1.0.1"},
      {:phoenix_integration, "~> 0.1"},
      # {:mock, github: "~> 0.2.0", only: :dev},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:dogma, "~> 0.1", only: :dev},
      {:mix_test_watch, "~> 0.2.6", only: :dev},
      {:edeliver, "~> 1.4.0"},
      {:distillery, ">= 0.8.0", warn_missing: false}

     # {:exometer_core, "~> 1.4.0"},
     # {:exometer, "~> 1.2.1"},
     # {:edown, github: "uwiger/edown", tag: "0.7", override: true}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
