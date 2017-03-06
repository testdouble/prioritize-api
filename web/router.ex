defmodule PrioritizeApi.Router do
  use PrioritizeApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrioritizeApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
    resources "/topics", TopicController
  end


  # We should not have both stacks used for /, will likely just be API at some point
  scope "/api", PrioritizeApi do
    pipe_through :api

    resources "/users", UserController
    resources "/topics", TopicController
  end
end
