import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :coop_chain, CoopChain.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "coop_chain_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :coop_chain, CoopChainWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "1stMQxX2ZliPdkV4GhUfQdFN2yh3KRf4Tq1XAVQ56JkMR4Q1rDulDBl67mXmbtp/",
  server: false

# In test we don't send emails.
config :coop_chain, CoopChain.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
