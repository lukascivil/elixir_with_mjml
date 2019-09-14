defmodule ElixirWithMjmlWeb.Router do
  use ElixirWithMjmlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirWithMjmlWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  scope "/api", ElixirWithMjmlWeb do
    pipe_through :api

    get "/mjml", MjmlController, :index
    post "/mjml", MjmlController, :compileMjml
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirWithMjmlWeb do
  #   pipe_through :api
  # end
end
