defmodule GeenowWeb.GameChannel do
  use Phoenix.Channel

  def join("join_world", _payload, socket) do
    {:ok, socket}
  end
end
