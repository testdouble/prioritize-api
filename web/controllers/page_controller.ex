defmodule PrioritizeApi.PageController do
  use PrioritizeApi.Web, :controller

  alias PrioritizeApi.Topic
  alias PrioritizeApi.User

  def index(conn, _params) do
    topics = Repo.all(Topic)
    users = Repo.all(User)
    render conn, "index.html", topics: topics, users: users
  end
end
