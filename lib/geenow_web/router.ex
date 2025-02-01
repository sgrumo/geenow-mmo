defmodule GeenowWeb.Router do
  use GeenowWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", GeenowWeb do
    pipe_through :api

    post "/signup", AuthController, :register
    post "/signin", AuthController, :login
  end

  scope "/api", GeenowWeb do
    pipe_through :api
  end
end
