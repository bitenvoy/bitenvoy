defmodule BitEnvoyHub.Repo.Migrations.CreateDeployable do
  use Ecto.Migration

  def change do
    create table(:deployables) do
      add :name, :string

      timestamps()
    end

  end
end
