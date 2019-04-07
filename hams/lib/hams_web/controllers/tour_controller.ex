defmodule HamsWeb.TourController do
  use HamsWeb, :controller

  alias Hams.Tours
  alias Hams.Tours.Tour
  alias Hams.Users
  alias Hams.Users.User

  def index(conn, _params) do
    tours = Tours.list_tours()
    render(conn, "index.html", tours: tours)
  end

  def new(conn, _params) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)

    if current_user && current_user.admin do
      changeset = Tours.change_tour(%Tour{})
      render(conn, "new.html", changeset: changeset)
    else
      redirect(conn, to: Routes.page_path(conn, :index))
    end
  end

  def create(conn, %{"tour" => tour_params}) do
    case Tours.create_tour(tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour created successfully.")
        |> redirect(to: Routes.tour_path(conn, :show, tour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)

    if current_user.admin do
      tour = Tours.get_tour!(id)
      render(conn, "show.html", tour: tour)
    else
      redirect(conn, to: Routes.page_path(conn, :index))
    end

  end

  def edit(conn, %{"id" => id}) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)

    tour = Tours.get_tour!(id)
    changeset = Tours.change_tour(tour)
    render(conn, "edit.html", tour: tour, changeset: changeset)
  end

  def join(conn, %{"id" => id, "tour" => tour_params}) do
    tour = Tours.get_tour!(id)
    current_user = Users.get_user(get_session(conn, :user_id) || -1)

    case Tours.update_tour(tour, tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour joined successfully.")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> putflash(:error, "An error occurred, please try again.")
    end
  end

  def update(conn, %{"id" => id, "tour" => tour_params}) do
    tour = Tours.get_tour!(id)

    case Tours.update_tour(tour, tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour updated successfully.")
        |> redirect(to: Routes.tour_path(conn, :show, tour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tour: tour, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tour = Tours.get_tour!(id)
    {:ok, _tour} = Tours.delete_tour(tour)

    conn
    |> put_flash(:info, "Tour deleted successfully.")
    |> redirect(to: Routes.tour_path(conn, :index))
  end
end
