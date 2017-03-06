defmodule PrioritizeApi.PageController do
  use PrioritizeApi.Web, :controller

  alias PrioritizeApi.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end
end
