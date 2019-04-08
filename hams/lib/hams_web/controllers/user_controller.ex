defmodule HamsWeb.UserController do
  use HamsWeb, :controller

  alias Hams.Users
  alias Hams.Users.User
  alias Hams.Tours
  alias Hams.Tours.Tour
  alias Hams.Schedules
  alias Hams.Schedules.ScheduleTour

  def index(conn, _params) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)

    if current_user && current_user.admin do
      users = Users.list_users()
      render(conn, "index.html", users: users)
    else
      redirect(conn, to: Routes.page_path(conn, :index))
    end

    users = Users.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)
    if current_user && current_user.admin do
      changeset = Users.change_user(%User{})
      render(conn, "new.html", changeset: changeset)
    else
      redirect(conn, to: Routes.page_path(conn, :index))
    end
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    requested_user = Users.get_user!(id)
    current_user = Users.get_user(get_session(conn, :user_id) || -1)
    tours = Tours.get_user_tours!(id)

    # if current user is an admin, they can view all other users, otherwise redirect to own profile
    if current_user.admin || current_user == requested_user do
      render(conn, "show.html", user: requested_user, tours: tours)
    else
      render(conn, "show.html", user: current_user)
    end

  end

  def edit(conn, %{"id" => id}) do
    current_user = Users.get_user(get_session(conn, :user_id) || -1)
    if current_user && current_user.admin do
      user = Users.get_user!(id)
      changeset = Users.change_user(user)
      render(conn, "edit.html", user: user, changeset: changeset)
    else
      redirect(conn, to: Routes.page_path(conn, :index))
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    {:ok, _user} = Users.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
