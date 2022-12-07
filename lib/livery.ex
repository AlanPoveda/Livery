defmodule Livery do
  alias Livery.Users.Create, as: UserCreate
  alias Livery.Users.GetUser, as: GetUser
  alias Livery.Users.Delete, as: DeleteUser
  @moduledoc """
  Livery keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate user_create(params), to: UserCreate, as: :call
  defdelegate by_id(id), to: GetUser, as: :by_id
  defdelegate delete_user(id), to: DeleteUser, as: :call
  
end
