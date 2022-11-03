defmodule Livery.Repo do
  use Ecto.Repo,
    otp_app: :livery,
    adapter: Ecto.Adapters.Postgres
end
