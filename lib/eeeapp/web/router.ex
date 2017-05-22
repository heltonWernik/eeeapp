defmodule Eeeapp.Web.Router do
  use Eeeapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Eeeapp.Web.PlayerAuthController, repo: Eeeapp.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Eeeapp.Web do
    pipe_through :browser

    get "/", PlayerController, :new
    get "/elm", PageController, :index
    resources "/players", PlayerController
    resources "/sessions", PlayerSessionController, only: [:new, :create, :delete]

    # Use the default browser stack
    # get "/", PageController, :index
    # resources "/players", PlayerController
  end

  # Other scopes may use custom stacks.
   scope "/api", Eeeapp.Web do
     pipe_through :api

     resources "/games", GameController, except: [:new, :edit]
  end
end
