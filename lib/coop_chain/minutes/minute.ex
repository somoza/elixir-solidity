defmodule CoopChain.Minutes.Minute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "minutes" do


    timestamps()
  end

  @doc false
  def changeset(minute, attrs) do
    minute
    |> cast(attrs, [])
    |> validate_required([])
  end
end
