defmodule CoopChain.Repo.Migrations.CreateMinutes do
  use Ecto.Migration

  def change do
    create table(:minutes) do

      timestamps()
    end
  end
end
