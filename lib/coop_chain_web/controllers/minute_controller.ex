defmodule CoopChainWeb.MinuteController do
  use CoopChainWeb, :controller

  alias CoopChain.Minutes
  alias CoopChain.Minutes.Minute

  def index(conn, _params) do
    minutes = Minutes.list_minutes()

    #ETH Package
    #Sending ethers.
    contract_address  = Application.get_env(:ethereumex, :contract_address)
    account1_private_key = "5b17b72f21c486a469fb9a5f601bf53060c933a010cfc9d1900c069f536cd220"
    account2_private_key = "747a1c0b6800ffb4d0b63b9fa767e7df4abe2b1c59719d1e8a15774d2e1b5505"
    account1_address =  Application.get_env(:ethereumex, :owner)
    account2_address =  "0x5c392f5288275f732A86e4906Aab99c30ACB3Be9"
    ETH.get_balance(account1_address)

    {:ok, tx_hash} = ETH.send_transaction(%{
      from: account2_address,
      to: account1_address,
      value: 10000000000000000000
    }, account2_private_key)

    ETH.get_transaction!(tx_hash)
    ETH.get_balance("0x5c392f5288275f732A86e4906Aab99c30ACB3Be9")
    #End of sending ethers.

    #Contract functions
    # function = "0x" <> (foo |> ExKeccak.hash_256 |> Base.encode16(case: :lower) |> String.slice(0..7))
    abi_encoded_data  = ABI.encode("addCoop(uint, string)", [1, "Animus"]) |> Base.encode16(case: :lower)

    {:ok, tx_hash} = ETH.send_transaction(%{
      to: contract_address,
      from: account1_address,
      gas: "0xc350",
      gasPrice: nil,
      data: "0x" <> abi_encoded_data,
    }, account1_private_key) #Signed as is a status modifier.

    ETH.get_transaction!(tx_hash)

    #Getter
    abi_encoded_data  = ABI.encode("getCoops()", []) |> Base.encode16(case: :lower)
    {:ok, response} = ETH.call(%{
      to: contract_address,
      from: account1_address,
      data: "0x" <> abi_encoded_data
    })

    response |> String.slice(2..-1) |> Base.decode16!(case: :lower) |> TypeDecoder.decode_raw([{:string, 256}])

    # render(conn, "index.html", minutes: [1,2,3,4], balance_bytes: "dsad")
  end

  def new(conn, _params) do
    changeset = Minutes.change_minute(%Minute{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"minute" => minute_params}) do
    case Minutes.create_minute(minute_params) do
      {:ok, minute} ->
        conn
        |> put_flash(:info, "Minute created successfully.")
        |> redirect(to: Routes.minute_path(conn, :show, minute))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    minute = Minutes.get_minute!(id)
    render(conn, "show.html", minute: minute)
  end

  def edit(conn, %{"id" => id}) do
    minute = Minutes.get_minute!(id)
    changeset = Minutes.change_minute(minute)
    render(conn, "edit.html", minute: minute, changeset: changeset)
  end

  def update(conn, %{"id" => id, "minute" => minute_params}) do
    minute = Minutes.get_minute!(id)

    case Minutes.update_minute(minute, minute_params) do
      {:ok, minute} ->
        conn
        |> put_flash(:info, "Minute updated successfully.")
        |> redirect(to: Routes.minute_path(conn, :show, minute))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", minute: minute, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    minute = Minutes.get_minute!(id)
    {:ok, _minute} = Minutes.delete_minute(minute)

    conn
    |> put_flash(:info, "Minute deleted successfully.")
    |> redirect(to: Routes.minute_path(conn, :index))
  end
end
