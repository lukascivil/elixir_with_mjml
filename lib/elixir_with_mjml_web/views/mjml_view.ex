defmodule ElixirWithMjmlWeb.MjmlView do
  use ElixirWithMjmlWeb, :view

  def render("index.json", %{message: message}) do
    %{hello: message}
  end

end