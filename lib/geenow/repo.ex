defmodule Geenow.Repo do
  use Ecto.Repo,
    otp_app: :geenow,
    adapter: Ecto.Adapters.Postgres
end
