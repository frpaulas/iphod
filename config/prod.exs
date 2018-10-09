use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# DeployTemplateWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.

config :iphod, IphodWeb.Endpoint,
  # load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json",
  # secret_key_base: System.get_env("SECRET_KEYBASE"),
  # secret_key_base: "!jy!R95NwKCk&=kXD_h9+_sUdgY2P_Iu9Db$MM6KdDmsWEV!QS#1Emguzxt#hCrL",
  server: true,
  code_reloader: false,
  version: Mix.Project.config()[:version]

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :deploy_template, DeployTemplateWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [:inet6,
#               port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :deploy_template, DeployTemplateWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# do not print debug messages in production
config :logger, level: :info

config :phoenix_distillery, PhoenixDistillery.Endpoint,
  # http: [port: System.get_env("PORT")],
  url: [host: "localhost", port: 80],
  root: ".",
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  version: Mix.Project.config()[:version]

# 
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :iphod, IphodWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :deploy_template, DeployTemplateWeb.Endpoint, server: true
#

# Configure your database
config :iphod, Iphod.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  username: "frpaulas",
  password: "Barafundle1570",
  database: "legereme",
  # The amount of database connections in the pool
  size: 20

config :shutdown_flag,
  flag_file: "/var/tmp/deploy/deploy-template/shutdown.flag",
  check_delay: 10_000

# Finally import the config/prod.secret.exs
# which should be versioned separately.
# import_config "prod.secret.exs"
