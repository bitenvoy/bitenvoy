defmodule BitEnvoyHub.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :output, :string
      add :state, :integer
      add :started, :datetime
      add :completed, :datetime

      timestamps()
    end

  end
end
