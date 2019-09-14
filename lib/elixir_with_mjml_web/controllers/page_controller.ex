defmodule ElixirWithMjmlWeb.PageController do
  use ElixirWithMjmlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
