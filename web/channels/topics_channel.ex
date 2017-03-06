defmodule PrioritizeApi.TopicsChannel do
  use PrioritizeApi.Web, :channel

  alias PrioritizeApi.TopicController

  def join("topics:" <> stage, payload, socket) when stage in ~w(suggest rank discuss) do
    if authorized?(payload) do
      # maybe broadcast to other users that someone has joined?
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # def handle_in("addTopic", %{"body" => payload}, socket) do
  def handle_in("addTopic", payload, socket) do
    TopicController.save_topic(%{title: payload["body"], description: "default"})
    broadcast! socket, "newTopic", payload
    {:noreply, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (topics:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
