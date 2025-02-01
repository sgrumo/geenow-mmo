defmodule GeenowWeb.UserSocket do
  use Phoenix.Socket

  channel "game:*", GeenowWeb.GameChannel

  def connect(%{"token" => token}, socket, _connection_info) do
    case Geenow.Auth.Guardian.decode_and_verify(token) do
      {:ok, claims} -> {:ok, assign(socket, :player_id, claims["sub"])}
      {:error, _reason} -> :error
    end
  end

  def id(socket), do: "user_socket:#{socket.assigns.player_id}"
end
