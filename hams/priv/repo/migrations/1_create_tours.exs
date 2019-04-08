defmodule Hams.Repo.Migrations.CreateTours do
  use Ecto.Migration

  def change do
    create table(:tours) do
      add :when, :naive_datetime
      add :type, :string
      add :guides_needed, :integer

      timestamps()
    end

  end
end
