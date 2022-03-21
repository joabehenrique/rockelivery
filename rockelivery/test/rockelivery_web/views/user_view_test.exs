defmodule RockeliveryWeb.UserViewTest do
  use RockeliveryWeb.ConnCase, async: true
  import Phoenix.View
  import Rockelivery.Factory
  alias RockeliveryWeb.UserView

  test "renders create.json" do
    user = build(:user)

    response = render(UserView, "create.json", user: user)

    assert %{
             message: "User created",
             user: %Rockelivery.User.User{
               address: "Rua Paulista 20º",
               age: 22,
               cep: "12345678",
               cpf: "12345678900",
               email: "henriquecidoz@hotmail.com",
               id: "13691c3b-3a27-4a19-bd1a-48f350bfb080",
               inserted_at: nil,
               name: "Joabe Henrique",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
