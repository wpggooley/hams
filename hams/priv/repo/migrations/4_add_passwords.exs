defmodule Hams.Repo.Migrations.AddPasswords do
  use Ecto.Migration

# per nat's notes: http://khoury.neu.edu/home/ntuck/courses/2019/01/cs4550/notes/14-multi-and-passwords/notes.html
  def change do
    alter table("users") do
      add :password_hash, :string
    end
  end
end
