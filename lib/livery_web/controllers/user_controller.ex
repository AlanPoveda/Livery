defmodule LiveryWeb.UserController do
  use LiveryWeb, :controller

  alias LiveryWeb.User
  alias Livery.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Livery.user_create(params) do
      conn
      |> put_status(:created)
      |> render("created.json", user: user) 
    end
  end
end
