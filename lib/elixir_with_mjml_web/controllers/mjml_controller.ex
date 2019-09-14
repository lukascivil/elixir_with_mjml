defmodule ElixirWithMjmlWeb.MjmlController do
  use ElixirWithMjmlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end

end