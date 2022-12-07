defmodule Livery.Users.GetUser do
  alias Livery.Repo
  alias Livery.Error
  alias Ecto.UUID

  alias LiveryWeb.User

  def by_id(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> get(uuid)
      :error -> {:error, Error.invalid_uuid()}
    end
  end


  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found()}
      user -> {:ok, user}
    end
  end

end
