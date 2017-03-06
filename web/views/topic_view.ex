defmodule PrioritizeApi.TopicView do
  use PrioritizeApi.Web, :view

  def render("topics.json", %{topics: topics}) do
    %{data: render_many(topics, PrioritizeApi.TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id,
      title: topic.title,
      description: topic.description,
      votes: topic.votes}
  end
end
