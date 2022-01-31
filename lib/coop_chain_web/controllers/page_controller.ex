defmodule CoopChainWeb.PageController do
  use CoopChainWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
