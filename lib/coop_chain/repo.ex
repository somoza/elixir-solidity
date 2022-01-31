defmodule CoopChain.Repo do
  use Ecto.Repo,
    otp_app: :coop_chain,
    adapter: Ecto.Adapters.Postgres
end
