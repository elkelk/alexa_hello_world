defmodule AlexaHelloWorldWeb.PageController do
  use AlexaHelloWorldWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
