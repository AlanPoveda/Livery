defmodule Livery.FallbackController do
  use LiveryWeb, :controller
  alias LiveryWeb.ErrorView


  def call(conn, {:error, %{status: status, result: result}}) do 
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
  
end
