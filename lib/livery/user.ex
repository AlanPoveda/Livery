defmodule LiveryWeb.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: :true}

  @required_params [:cpf, :name, :cpf, :email, :password]
  schema "users" do
    field :age, :integer
    field :name, :string
    field :cpf, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :address, :string
    field :cep, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params,@required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do  
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset

end
