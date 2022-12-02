defmodule LiveryWeb.UsersView do
  use LiveryWeb, :view

  alias LiveryWeb.User


  def render("created.json", %{user: %User{} = user}) do
    %{
      message:  "User created",
      user: %{
        id: user.id,
        name: user.name
      }
    } 
  end 
end
