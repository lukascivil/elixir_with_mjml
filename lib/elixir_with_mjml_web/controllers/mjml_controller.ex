defmodule ElixirWithMjmlWeb.MjmlController do
  use ElixirWithMjmlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end

  # defp compile(message) do
  #   case :os.cmd(:"cat << EOF | mjml -i #{message}") do
  #     {html, 0} -> html
  #     _         -> raise "Error MJML exited with non zero status"
  #   end
  # end

  def compileMjml(conn, %{"mjmlTemplate" => mjmlTemplate}) when is_binary(mjmlTemplate) do
    with {html, 0} <- :os.cmd("cat << EOF | mjml -i #{mjmlTemplate}") |> IO.inspect do
        render(conn, "index.json", message: html)
    else
        _error -> raise "Error MJML exited with non zero status"
    end
  end

  # def compileMjml(conn, %{"mjmlTemplate" => mjmlTemplate} = params) do
  #   render(conn, "index.json", message: compile(mjmlTemplate))
  # end

end