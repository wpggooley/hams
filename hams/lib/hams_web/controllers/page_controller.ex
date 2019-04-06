defmodule HamsWeb.PageController do
  use HamsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
