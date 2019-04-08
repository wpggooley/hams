defmodule Hams.Schedules do
  @moduledoc """
  The Schedules context.
  """

  import Ecto.Query, warn: false
  alias Hams.Repo

  alias Hams.Schedules.ScheduleTour

  @doc """
  Returns the list of schedule_tours.

  ## Examples

      iex> list_schedule_tours()
      [%ScheduleTour{}, ...]

  """
  def list_schedule_tours do
    Repo.all(ScheduleTour)
  end

  @doc """
  Gets a single schedule_tour.

  Raises `Ecto.NoResultsError` if the Schedule tour does not exist.

  ## Examples

      iex> get_schedule_tour!(123)
      %ScheduleTour{}

      iex> get_schedule_tour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_schedule_tour!(id), do: Repo.get!(ScheduleTour, id)

  @doc """
  Creates a schedule_tour.

  ## Examples

      iex> create_schedule_tour(%{field: value})
      {:ok, %ScheduleTour{}}

      iex> create_schedule_tour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_schedule_tour(attrs \\ %{}) do
    %ScheduleTour{}
    |> ScheduleTour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a schedule_tour.

  ## Examples

      iex> update_schedule_tour(schedule_tour, %{field: new_value})
      {:ok, %ScheduleTour{}}

      iex> update_schedule_tour(schedule_tour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_schedule_tour(%ScheduleTour{} = schedule_tour, attrs) do
    schedule_tour
    |> ScheduleTour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ScheduleTour.

  ## Examples

      iex> delete_schedule_tour(schedule_tour)
      {:ok, %ScheduleTour{}}

      iex> delete_schedule_tour(schedule_tour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_schedule_tour(%ScheduleTour{} = schedule_tour) do
    Repo.delete(schedule_tour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking schedule_tour changes.

  ## Examples

      iex> change_schedule_tour(schedule_tour)
      %Ecto.Changeset{source: %ScheduleTour{}}

  """
  def change_schedule_tour(%ScheduleTour{} = schedule_tour) do
    ScheduleTour.changeset(schedule_tour, %{})
  end
end
