defmodule Geenow.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :password_hash, :string
      add :email, :string
      add :last_login, :naive_datetime
      add :is_online, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
