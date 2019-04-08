defmodule Hams.SchedulesTest do
  use Hams.DataCase

  alias Hams.Schedules

  describe "schedule_tours" do
    alias Hams.Schedules.ScheduleTour

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def schedule_tour_fixture(attrs \\ %{}) do
      {:ok, schedule_tour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedules.create_schedule_tour()

      schedule_tour
    end

    test "list_schedule_tours/0 returns all schedule_tours" do
      schedule_tour = schedule_tour_fixture()
      assert Schedules.list_schedule_tours() == [schedule_tour]
    end

    test "get_schedule_tour!/1 returns the schedule_tour with given id" do
      schedule_tour = schedule_tour_fixture()
      assert Schedules.get_schedule_tour!(schedule_tour.id) == schedule_tour
    end

    test "create_schedule_tour/1 with valid data creates a schedule_tour" do
      assert {:ok, %ScheduleTour{} = schedule_tour} = Schedules.create_schedule_tour(@valid_attrs)
    end

    test "create_schedule_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedules.create_schedule_tour(@invalid_attrs)
    end

    test "update_schedule_tour/2 with valid data updates the schedule_tour" do
      schedule_tour = schedule_tour_fixture()
      assert {:ok, %ScheduleTour{} = schedule_tour} = Schedules.update_schedule_tour(schedule_tour, @update_attrs)
    end

    test "update_schedule_tour/2 with invalid data returns error changeset" do
      schedule_tour = schedule_tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedules.update_schedule_tour(schedule_tour, @invalid_attrs)
      assert schedule_tour == Schedules.get_schedule_tour!(schedule_tour.id)
    end

    test "delete_schedule_tour/1 deletes the schedule_tour" do
      schedule_tour = schedule_tour_fixture()
      assert {:ok, %ScheduleTour{}} = Schedules.delete_schedule_tour(schedule_tour)
      assert_raise Ecto.NoResultsError, fn -> Schedules.get_schedule_tour!(schedule_tour.id) end
    end

    test "change_schedule_tour/1 returns a schedule_tour changeset" do
      schedule_tour = schedule_tour_fixture()
      assert %Ecto.Changeset{} = Schedules.change_schedule_tour(schedule_tour)
    end
  end
end
