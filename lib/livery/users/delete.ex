defmodule Livery.Users.Delete do
  alias LiveryWeb.User
  alias Ecto.UUID
  
  alias Livery.Repo
  alias Livery.Error

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_uuid()}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.user_not_found()}
      user -> Repo.delete(user)
    end
  end
  
end
