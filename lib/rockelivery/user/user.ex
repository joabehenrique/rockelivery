defmodule Rockelivery.User.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rockelivery.Order.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:age, :address, :cep, :cpf, :email, :password, :name]
  @update_params @required_params -- [:password]
  @derive {Jason.Encoder, only: [:id, :name, :age, :cpf, :address, :email]}

  schema "users" do
    field(:age, :integer)
    field(:address, :string)
    field(:cep, :string)
    field(:cpf, :string)
    field(:email, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field(:name, :string)

    has_many(:orders, Order)

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(params), do: generate_changeset(params, @required_params)
  def changeset(struct, params), do: generate_changeset(struct, params, @update_params)

  def generate_changeset(struct \\ %__MODULE__{}, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
