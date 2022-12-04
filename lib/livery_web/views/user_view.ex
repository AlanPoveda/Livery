defmodule LiveryWeb.UserView do
  use LiveryWeb, :view

  alias LiveryWeb.User


  def render("created.json", %{user: %User{} = user}) do
    %{
      message:  "User created",
      user: user
    } 
  end 
end
