defmodule PrioritizeApi.TopicController do
  use PrioritizeApi.Web, :controller

  alias PrioritizeApi.Topic

  def index(conn, %{"format" => "json"} = params) do
    topics =
      Repo.all(Topic)
      |> Enum.map(fn (t) -> Repo.preload(t, :votes) end)
      |> Enum.map(fn (t) -> %{id: t.id, title: t.title, description: t.description, votes: Enum.count(t.votes)} end)
    render(conn, "topics.json", topics: topics)
  end

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do
    case save_topic(topic_params) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def save_topic(topic) do
    changeset = Topic.changeset(%Topic{}, topic)
    Repo.insert(changeset)
  end

  def show(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    render(conn, "show.html", topic: topic)
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    changeset = Topic.changeset(topic)
    render(conn, "edit.html", topic: topic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Repo.get!(Topic, id)
    changeset = Topic.changeset(topic, topic_params)

    case Repo.update(changeset) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully.")
        |> redirect(to: topic_path(conn, :show, topic))
      {:error, changeset} ->
        render(conn, "edit.html", topic: topic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(topic)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: topic_path(conn, :index))
  end
end
