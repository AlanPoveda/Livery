defmodule Livery.Users.GetUser do
  alias Livery.Repo
  alias Ecto.UUID

  alias LiveryWeb.User

  def by_id(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> get(uuid)
      :error -> {:error, %{status: :bad_request, result: "Invalid ID"}}
    end
  end


  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> {:ok, user}
    end
  end

end
