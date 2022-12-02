defmodule LiveryWeb.UserController do
  use LiveryWeb, :controller

  alias LiveryWeb.User

  def create(conn, params) do
    with {:ok, %User{user: user}} <- Livery.user_create(params) do
      conn
      |> put_status(:created)
      |> render("created.json", user: user) 
    end
  end
end
