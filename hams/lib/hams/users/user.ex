defmodule Hams.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :fname, :string
    field :lname, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :fname, :lname])
    |> validate_required([:email, :admin, :fname, :lname])
  end
end
