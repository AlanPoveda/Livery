defmodule Livery.Users.Create do
  alias Livery.Repo
  alias LiveryWeb.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
