defmodule Rockelivery.Order.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rockelivery.Item.Item
  alias Rockelivery.User.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:address, :comments, :payment_method, :user_id]
  @payment_categories [:money, :credit_card, :debit_card]
  @derive {Jason.Encoder, only: [:id, :address, :comments, :payment_method, :user_id, :items]}

  schema "orders" do
    field(:address, :string)
    field(:comments, :string)
    field(:payment_method, Ecto.Enum, values: @payment_categories)

    many_to_many(:items, Item, join_through: "orders_items")
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
  end
end
