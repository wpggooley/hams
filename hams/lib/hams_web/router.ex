defmodule HamsWeb.Router do
  use HamsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HamsWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HamsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/tours", TourController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", HamsWeb do
  #   pipe_through :api
  # end
end
