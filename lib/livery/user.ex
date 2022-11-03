defmodule LiveryWeb.User do
  use Ecto.Schema
  import Repo.Changeset

  @primary_key {:id, :binary_id, autogenerate: :true}

  schema "users" do
    field :age, :interger
    field :name, :string
    field :cpf, :string
    field :password_hash, :string
    field :email, :string
    field :address, :string
    field :cep, :string

    timestamps()
  end


  def changeset() do
  end
end
