defmodule HamsWeb.ScheduleTourControllerTest do
  use HamsWeb.ConnCase

  alias Hams.Schedules

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:schedule_tour) do
    {:ok, schedule_tour} = Schedules.create_schedule_tour(@create_attrs)
    schedule_tour
  end

  describe "index" do
    test "lists all schedule_tours", %{conn: conn} do
      conn = get(conn, Routes.schedule_tour_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Schedule tours"
    end
  end

  describe "new schedule_tour" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.schedule_tour_path(conn, :new))
      assert html_response(conn, 200) =~ "New Schedule tour"
    end
  end

  describe "create schedule_tour" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.schedule_tour_path(conn, :create), schedule_tour: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.schedule_tour_path(conn, :show, id)

      conn = get(conn, Routes.schedule_tour_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Schedule tour"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.schedule_tour_path(conn, :create), schedule_tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Schedule tour"
    end
  end

  describe "edit schedule_tour" do
    setup [:create_schedule_tour]

    test "renders form for editing chosen schedule_tour", %{conn: conn, schedule_tour: schedule_tour} do
      conn = get(conn, Routes.schedule_tour_path(conn, :edit, schedule_tour))
      assert html_response(conn, 200) =~ "Edit Schedule tour"
    end
  end

  describe "update schedule_tour" do
    setup [:create_schedule_tour]

    test "redirects when data is valid", %{conn: conn, schedule_tour: schedule_tour} do
      conn = put(conn, Routes.schedule_tour_path(conn, :update, schedule_tour), schedule_tour: @update_attrs)
      assert redirected_to(conn) == Routes.schedule_tour_path(conn, :show, schedule_tour)

      conn = get(conn, Routes.schedule_tour_path(conn, :show, schedule_tour))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, schedule_tour: schedule_tour} do
      conn = put(conn, Routes.schedule_tour_path(conn, :update, schedule_tour), schedule_tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Schedule tour"
    end
  end

  describe "delete schedule_tour" do
    setup [:create_schedule_tour]

    test "deletes chosen schedule_tour", %{conn: conn, schedule_tour: schedule_tour} do
      conn = delete(conn, Routes.schedule_tour_path(conn, :delete, schedule_tour))
      assert redirected_to(conn) == Routes.schedule_tour_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.schedule_tour_path(conn, :show, schedule_tour))
      end
    end
  end

  defp create_schedule_tour(_) do
    schedule_tour = fixture(:schedule_tour)
    {:ok, schedule_tour: schedule_tour}
  end
end
