defmodule Hams.Schedules.ScheduleTour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedule_tours" do
    field :user_id, :integer
    field :tour_id, :integer

    timestamps()
  end

  @doc false
  def changeset(schedule_tour, attrs) do
    schedule_tour
    |> cast(attrs, [:user_id, :tour_id])
    |> validate_required([:user_id, :tour_id])
  end
end
