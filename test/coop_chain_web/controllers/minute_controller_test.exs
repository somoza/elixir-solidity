defmodule CoopChainWeb.MinuteControllerTest do
  use CoopChainWeb.ConnCase

  import CoopChain.MinutesFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all minutes", %{conn: conn} do
      conn = get(conn, Routes.minute_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Minutes"
    end
  end

  describe "new minute" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.minute_path(conn, :new))
      assert html_response(conn, 200) =~ "New Minute"
    end
  end

  describe "create minute" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.minute_path(conn, :create), minute: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.minute_path(conn, :show, id)

      conn = get(conn, Routes.minute_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Minute"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.minute_path(conn, :create), minute: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Minute"
    end
  end

  describe "edit minute" do
    setup [:create_minute]

    test "renders form for editing chosen minute", %{conn: conn, minute: minute} do
      conn = get(conn, Routes.minute_path(conn, :edit, minute))
      assert html_response(conn, 200) =~ "Edit Minute"
    end
  end

  describe "update minute" do
    setup [:create_minute]

    test "redirects when data is valid", %{conn: conn, minute: minute} do
      conn = put(conn, Routes.minute_path(conn, :update, minute), minute: @update_attrs)
      assert redirected_to(conn) == Routes.minute_path(conn, :show, minute)

      conn = get(conn, Routes.minute_path(conn, :show, minute))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, minute: minute} do
      conn = put(conn, Routes.minute_path(conn, :update, minute), minute: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Minute"
    end
  end

  describe "delete minute" do
    setup [:create_minute]

    test "deletes chosen minute", %{conn: conn, minute: minute} do
      conn = delete(conn, Routes.minute_path(conn, :delete, minute))
      assert redirected_to(conn) == Routes.minute_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.minute_path(conn, :show, minute))
      end
    end
  end

  defp create_minute(_) do
    minute = minute_fixture()
    %{minute: minute}
  end
end
