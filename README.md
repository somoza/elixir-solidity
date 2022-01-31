# Motivation

The commonest use is to let visitors sign their own transactions because of the gas costs. Sometimes we have special scenarios like
  * A private and free Etherium network using PoA
  * Transparent dapps (we can't ask so many inexpert people to install and configure Metamask)

The epecific controllers which manage this are on /lib/coop_chain_web/controllers folder

*This example was programmed using a local Ganache/Truffle enviroment, hence I didn't bother removing the private keys and those not represent any real address.

# CoopChain

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
