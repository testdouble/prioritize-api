defmodule PrioritizeApi.TopicsChannel do
  use PrioritizeApi.Web, :channel

  alias PrioritizeApi.{Topic, TopicController, VoteController}

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
    TopicController.save_topic(%{title: payload["title"], description: payload["description"]})
    broadcast! socket, "newTopic", payload
    {:noreply, socket}
  end

  def handle_in("addVote", payload, socket) do
    response  = VoteController.save_vote(%{user_id: payload["user_id"], topic_id: payload["topic_id"]})

    case response do
      {:ok, vote} ->
        votes = votes_for_topic(vote.topic_id)
        broadcast! socket, "newVote", Map.put(payload, :vote_count, votes)
      {:error, stuff} ->
        IO.puts inspect(stuff)
        broadcast! socket, "failedVote", payload
    end

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

  defp votes_for_topic(topic_id) do
    Repo.get(Topic, topic_id)
    |> Repo.preload(:votes)
    |> Map.fetch!(:votes)
    |> Enum.count
  end
end
