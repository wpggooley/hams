defmodule Hams.Repo do
  use Ecto.Repo,
    otp_app: :hams,
    adapter: Ecto.Adapters.Postgres
end
