defmodule PrioritizeApi.UserView do
  use PrioritizeApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PrioritizeApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PrioritizeApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email}
  end
end
