defmodule HamsWeb.ScheduleTourController do
  use HamsWeb, :controller

  alias Hams.Schedules
  alias Hams.Schedules.ScheduleTour
  alias Hams.Tours
  alias Hams.Tours.Tour
  alias Hams.Repo

  def index(conn, _params) do
    schedule_tours = Schedules.list_schedule_tours()
    render(conn, "index.html", schedule_tours: schedule_tours)
  end

  def new(conn, _params) do
    changeset = Schedules.change_schedule_tour(%ScheduleTour{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"schedule_tour" => schedule_tour_params}) do
    case Schedules.create_schedule_tour(schedule_tour_params) do
      {:ok, schedule_tour} ->
        tourResult = Tours.get_tour!(schedule_tour.tour_id)
        lessguides = tourResult.guides_needed - 1
        tour = %Tour{id: tourResult.id, type: tourResult.type, when: tourResult.when, guides_needed: tourResult.guides_needed, inserted_at: tourResult.inserted_at}
        newtour = %{id: tourResult.id, type: tourResult.type, when: tourResult.when, guides_needed: lessguides, inserted_at: tourResult.inserted_at}
        # Tours.update_tour(tour, newtour)
        Repo.update(Tour.changeset(tour, newtour)) do
          conn
          |> redirect(to: Routes.tour_path(conn, :index))
        end
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "An error occurred, please try again.")
    end
  end

  def show(conn, %{"id" => id}) do
    schedule_tour = Schedules.get_schedule_tour!(id)
    render(conn, "show.html", schedule_tour: schedule_tour)
  end

  def edit(conn, %{"id" => id}) do
    schedule_tour = Schedules.get_schedule_tour!(id)
    changeset = Schedules.change_schedule_tour(schedule_tour)
    render(conn, "edit.html", schedule_tour: schedule_tour, changeset: changeset)
  end

  def update(conn, %{"id" => id, "schedule_tour" => schedule_tour_params}) do
    schedule_tour = Schedules.get_schedule_tour!(id)

    case Schedules.update_schedule_tour(schedule_tour, schedule_tour_params) do
      {:ok, schedule_tour} ->
        conn
        |> put_flash(:info, "Schedule tour updated successfully.")
        |> redirect(to: Routes.schedule_tour_path(conn, :show, schedule_tour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", schedule_tour: schedule_tour, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    schedule_tour = Schedules.get_schedule_tour!(id)
    {:ok, _schedule_tour} = Schedules.delete_schedule_tour(schedule_tour)

    conn
    |> put_flash(:info, "Schedule tour deleted successfully.")
    |> redirect(to: Routes.schedule_tour_path(conn, :index))
  end
end
