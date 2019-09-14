defmodule ElixirWithMjmlWeb.MjmlView do
  use ElixirWithMjmlWeb, :view

  def render("index.json", %{}) do
    %{hello: "world com café"}
  end

end