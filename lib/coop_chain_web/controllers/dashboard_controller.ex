defmodule CoopChainWeb.DashboardController do
  use CoopChainWeb, :controller

  def index(conn, _params) do
    web3_version = Ethereumex.HttpClient.web3_client_version
    balance = (Integer.parse(Ethereumex.HttpClient.eth_get_balance(Application.get_env(:ethereumex, :wallet))
    |> elem(1)
    |> String.replace("0x", ""), 16)
    |> elem(0)) / 1000000000000000000

    gas_price = (Integer.parse(Ethereumex.HttpClient.eth_gas_price()
    |> elem(1) |> String.replace("0x", ""), 16)
    |> elem(0)) / 1000000000000000000

    net_version = Ethereumex.HttpClient.net_version() |> elem(1)
    block_number = Integer.parse(Ethereumex.HttpClient.eth_block_number() |> elem(1) |> String.replace("0x", ""), 16) |> elem(0)
    render(conn, "index.html", web3_version: web3_version |> elem(1), balance: balance, wallet: Application.get_env(:ethereumex, :wallet), gas_price: gas_price, net_version: net_version, block_number: block_number)
  end

end
