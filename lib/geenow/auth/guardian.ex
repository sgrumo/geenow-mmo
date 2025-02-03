defmodule Geenow.Auth.Guardian do
  @moduledoc """
  This module provides basic auth functionalities
  """

  use Guardian, otp_app: :geenow

  def subject_for_token(%{id: id}, _claims) do
    {:ok, to_string(id)}
  end

  def subject_for_token(_, _) do
    {:error, :invalid_resource}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Geenow.Accounts.get_user!(id) do
      {:ok, user} -> {:ok, user}
      _ -> {:error, :resource_not_found}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :invalid_claims}
  end
end
