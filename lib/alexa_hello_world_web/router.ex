defmodule AlexaHelloWorldWeb.Router do
  use AlexaHelloWorldWeb, :router

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

  scope "/", AlexaHelloWorldWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", AlexaHelloWorldWeb do
    pipe_through :api

    post "/alexa/:uid", Api.AlexaWebhookController, :incoming
  end
end
