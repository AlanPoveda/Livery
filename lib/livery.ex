defmodule Livery do
  alias Livery.Users.Create, as: UserCreate
  alias Livery.Users.GetUser, as: GetUser
  @moduledoc """
  Livery keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate user_create(params), to: UserCreate, as: :call
  defdelegate by_id(id), to: GetUser, as: :by_id
  
end
