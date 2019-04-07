defmodule Hams.Tours do
  @moduledoc """
  The Tours context.
  """

  import Ecto.Query, warn: false
  alias Hams.Repo

  alias Hams.Tours.Tour

  @doc """
  Returns the list of tours.

  ## Examples

      iex> list_tours()
      [%Tour{}, ...]

  """
  def list_tours do
    Repo.all(Tour)
  end

  @doc """
  Gets a single tour.

  Raises `Ecto.NoResultsError` if the Tour does not exist.

  ## Examples

      iex> get_tour!(123)
      %Tour{}

      iex> get_tour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tour!(id), do: Repo.get!(Tour, id)

  @doc """
  Creates a tour.

  ## Examples

      iex> create_tour(%{field: value})
      {:ok, %Tour{}}

      iex> create_tour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tour(attrs \\ %{}) do
    %Tour{}
    |> Tour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tour.

  ## Examples

      iex> update_tour(tour, %{field: new_value})
      {:ok, %Tour{}}

      iex> update_tour(tour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tour(%Tour{} = tour, attrs) do
    tour
    |> Tour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tour.

  ## Examples

      iex> delete_tour(tour)
      {:ok, %Tour{}}

      iex> delete_tour(tour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tour(%Tour{} = tour) do
    Repo.delete(tour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tour changes.

  ## Examples

      iex> change_tour(tour)
      %Ecto.Changeset{source: %Tour{}}

  """
  def change_tour(%Tour{} = tour) do
    Tour.changeset(tour, %{})
  end
end
