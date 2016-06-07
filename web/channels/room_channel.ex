defmodule PrioritizeApi.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, "hello", socket}
  end
  # def join("rooms:" <> _private_room_id, _params, _socket) do
  #   {:error, %{reason: "unauthorized"}}
  # end

  def handle_in("ping", %{"body" => body}, socket) do
    # push socket, "pong", %{body: body}
    broadcast! socket, "pong", %{body: body}
    {:noreply, socket}
  end
end
