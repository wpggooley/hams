defmodule Hams.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :admin, :boolean, default: false, null: false
      add :fname, :string, null: false
      add :lname, :string, null: false

      timestamps()
    end
  end
end
