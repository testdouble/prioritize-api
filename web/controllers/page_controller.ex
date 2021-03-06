defmodule PrioritizeApi.PageController do
  use PrioritizeApi.Web, :controller

  alias PrioritizeApi.Topic
  alias PrioritizeApi.User

  def index(conn, _params) do
    topics =
      Repo.all(Topic)
      |> gather_votes
    users = Repo.all(User)
    render conn, "index.html", topics: topics, users: users
  end

  defp gather_votes(topics) do
    Enum.map(topics, fn (t) -> Repo.preload(t, :votes) end)
  end
end
