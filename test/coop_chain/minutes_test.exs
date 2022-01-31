defmodule CoopChain.MinutesTest do
  use CoopChain.DataCase

  alias CoopChain.Minutes

  describe "minutes" do
    alias CoopChain.Minutes.Minute

    import CoopChain.MinutesFixtures

    @invalid_attrs %{}

    test "list_minutes/0 returns all minutes" do
      minute = minute_fixture()
      assert Minutes.list_minutes() == [minute]
    end

    test "get_minute!/1 returns the minute with given id" do
      minute = minute_fixture()
      assert Minutes.get_minute!(minute.id) == minute
    end

    test "create_minute/1 with valid data creates a minute" do
      valid_attrs = %{}

      assert {:ok, %Minute{} = minute} = Minutes.create_minute(valid_attrs)
    end

    test "create_minute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Minutes.create_minute(@invalid_attrs)
    end

    test "update_minute/2 with valid data updates the minute" do
      minute = minute_fixture()
      update_attrs = %{}

      assert {:ok, %Minute{} = minute} = Minutes.update_minute(minute, update_attrs)
    end

    test "update_minute/2 with invalid data returns error changeset" do
      minute = minute_fixture()
      assert {:error, %Ecto.Changeset{}} = Minutes.update_minute(minute, @invalid_attrs)
      assert minute == Minutes.get_minute!(minute.id)
    end

    test "delete_minute/1 deletes the minute" do
      minute = minute_fixture()
      assert {:ok, %Minute{}} = Minutes.delete_minute(minute)
      assert_raise Ecto.NoResultsError, fn -> Minutes.get_minute!(minute.id) end
    end

    test "change_minute/1 returns a minute changeset" do
      minute = minute_fixture()
      assert %Ecto.Changeset{} = Minutes.change_minute(minute)
    end
  end
end
