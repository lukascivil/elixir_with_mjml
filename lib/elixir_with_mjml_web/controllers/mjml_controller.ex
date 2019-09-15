defmodule ElixirWithMjmlWeb.MjmlController do
  use ElixirWithMjmlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end

  # defp compileMjml(message) do
  #   case :os.cmd(:"cat #{path}/mjml.sh") do
  #     {html, 0} -> html
  #     _         -> raise "Error MJML exited with non zero status"
  #   end
  # end

  defp sanitize(message) do
    message
    |> to_string
    |> String.replace("\n", "")
    |> String.replace("<!-- FILE: undefined -->", "")    
  end

  def compileMjml(conn, %{"mjmlTemplate" => mjmlTemplate}) when is_binary(mjmlTemplate) do
    with path <- :code.priv_dir(:elixir_with_mjml),
      html <- :os.cmd(:"#{path}/mjml.sh '#{mjmlTemplate}'") |> IO.inspect do
        render(conn, "index.json", message: sanitize(html))
    else
        _error -> raise "Error MJML exited with non zero status"
    end
  end

  # def compileMjml(conn, %{"mjmlTemplate" => mjmlTemplate}) when is_binary(mjmlTemplate) do
  #   with path <- :code.priv_dir(:elixir_with_mjml), 
  #     {html, 0} <- :os.cmd(:"cat #{path}/mjml.sh") |> IO.inspect do
  #       render(conn, "index.json", message: html)
  #   else
  #       _error -> raise "Error MJML exited with non zero status"
  #   end
  # end

  # def compileMjml(conn, %{"mjmlTemplate" => mjmlTemplate} = params) do
  #   render(conn, "index.json", message: compile(mjmlTemplate))
  # end

end


#!/bin/bash
# <mjml><mj-body><mj-section></mj-section></mj-body></mjml>

# cat << EOF | mjml -i
# $1
# EOF


# STATUS=$(EOF | mjml -i
# $1
# EOF
# )
# echo $STATUS
