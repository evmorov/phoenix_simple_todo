defmodule PhoenixSimpleTodoWeb.PageController do
  use PhoenixSimpleTodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
