defmodule LiveryWeb.UsersView do
  use LiveryWeb, :view

  import LiveryWeb.User


  def render("created.json", %{%User{} = user}) do
    %{
      message:  "User created",
      user: %{
        id: user.id,
        name: user.name
      }
    } 
  end 
end
