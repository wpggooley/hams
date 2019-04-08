defmodule Hams.ToursTest do
  use Hams.DataCase

  alias Hams.Tours

  describe "tours" do
    alias Hams.Tours.Tour

    @valid_attrs %{guides_needed: "some guides_needed", integer: "some integer", type: "some type", when: ~N[2010-04-17 14:00:00]}
    @update_attrs %{guides_needed: "some updated guides_needed", integer: "some updated integer", type: "some updated type", when: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{guides_needed: nil, integer: nil, type: nil, when: nil}

    def tour_fixture(attrs \\ %{}) do
      {:ok, tour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tours.create_tour()

      tour
    end

    test "list_tours/0 returns all tours" do
      tour = tour_fixture()
      assert Tours.list_tours() == [tour]
    end

    test "get_tour!/1 returns the tour with given id" do
      tour = tour_fixture()
      assert Tours.get_tour!(tour.id) == tour
    end

    test "create_tour/1 with valid data creates a tour" do
      assert {:ok, %Tour{} = tour} = Tours.create_tour(@valid_attrs)
      assert tour.guides_needed == "some guides_needed"
      assert tour.integer == "some integer"
      assert tour.type == "some type"
      assert tour.when == ~N[2010-04-17 14:00:00]
    end

    test "create_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tours.create_tour(@invalid_attrs)
    end

    test "update_tour/2 with valid data updates the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{} = tour} = Tours.update_tour(tour, @update_attrs)
      assert tour.guides_needed == "some updated guides_needed"
      assert tour.integer == "some updated integer"
      assert tour.type == "some updated type"
      assert tour.when == ~N[2011-05-18 15:01:01]
    end

    test "update_tour/2 with invalid data returns error changeset" do
      tour = tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Tours.update_tour(tour, @invalid_attrs)
      assert tour == Tours.get_tour!(tour.id)
    end

    test "delete_tour/1 deletes the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{}} = Tours.delete_tour(tour)
      assert_raise Ecto.NoResultsError, fn -> Tours.get_tour!(tour.id) end
    end

    test "change_tour/1 returns a tour changeset" do
      tour = tour_fixture()
      assert %Ecto.Changeset{} = Tours.change_tour(tour)
    end
  end
end
