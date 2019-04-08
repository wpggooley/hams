defmodule HamsWeb.TourControllerTest do
  use HamsWeb.ConnCase

  alias Hams.Tours

  @create_attrs %{guides_needed: "some guides_needed", integer: "some integer", type: "some type", when: ~N[2010-04-17 14:00:00]}
  @update_attrs %{guides_needed: "some updated guides_needed", integer: "some updated integer", type: "some updated type", when: ~N[2011-05-18 15:01:01]}
  @invalid_attrs %{guides_needed: nil, integer: nil, type: nil, when: nil}

  def fixture(:tour) do
    {:ok, tour} = Tours.create_tour(@create_attrs)
    tour
  end

  describe "index" do
    test "lists all tours", %{conn: conn} do
      conn = get(conn, Routes.tour_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tours"
    end
  end

  describe "new tour" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tour_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "create tour" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tour_path(conn, :create), tour: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tour_path(conn, :show, id)

      conn = get(conn, Routes.tour_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tour"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tour_path(conn, :create), tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "edit tour" do
    setup [:create_tour]

    test "renders form for editing chosen tour", %{conn: conn, tour: tour} do
      conn = get(conn, Routes.tour_path(conn, :edit, tour))
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "update tour" do
    setup [:create_tour]

    test "redirects when data is valid", %{conn: conn, tour: tour} do
      conn = put(conn, Routes.tour_path(conn, :update, tour), tour: @update_attrs)
      assert redirected_to(conn) == Routes.tour_path(conn, :show, tour)

      conn = get(conn, Routes.tour_path(conn, :show, tour))
      assert html_response(conn, 200) =~ "some updated guides_needed"
    end

    test "renders errors when data is invalid", %{conn: conn, tour: tour} do
      conn = put(conn, Routes.tour_path(conn, :update, tour), tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "delete tour" do
    setup [:create_tour]

    test "deletes chosen tour", %{conn: conn, tour: tour} do
      conn = delete(conn, Routes.tour_path(conn, :delete, tour))
      assert redirected_to(conn) == Routes.tour_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.tour_path(conn, :show, tour))
      end
    end
  end

  defp create_tour(_) do
    tour = fixture(:tour)
    {:ok, tour: tour}
  end
end
