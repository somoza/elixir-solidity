defmodule CoopChain.MinutesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoopChain.Minutes` context.
  """

  @doc """
  Generate a minute.
  """
  def minute_fixture(attrs \\ %{}) do
    {:ok, minute} =
      attrs
      |> Enum.into(%{

      })
      |> CoopChain.Minutes.create_minute()

    minute
  end
end
