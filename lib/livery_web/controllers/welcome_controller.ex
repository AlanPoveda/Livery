defmodule LiveryWeb.WelcomeController do
  use LiveryWeb, :controller

  def index(conn, %{"id" => id}) do
    conn
    |> put_status(:ok)
    |> json(%{"message": id})
  end
end
