defmodule Hams.Repo.Migrations.CreateScheduleTours do
  use Ecto.Migration

  def change do
    create table(:schedule_tours) do
      add :user_id, :integer
      add :tour_id, :integer

      timestamps()
    end

    create index(:schedule_tours, [:user_id])
    create index(:schedule_tours, [:tour_id])
  end
end
