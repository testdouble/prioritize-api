defmodule PrioritizeApi.PageController do
  use PrioritizeApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
