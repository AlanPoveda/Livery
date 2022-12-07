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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Livery.by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Livery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end 
  end
end
