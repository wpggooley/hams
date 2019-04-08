defmodule Hams.Tours.Tour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tours" do
    field :guides_needed, :integer
    field :type, :string
    field :when, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(tour, attrs) do
    tour
    |> cast(attrs, [:when, :type, :guides_needed])
    |> validate_required([:when, :type, :guides_needed])
  end
end
