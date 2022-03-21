defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User.User

  def user_params_factory,
    do: %{
      age: 22,
      address: "Rua Paulista 20º",
      cep: "12345678",
      cpf: "12345678900",
      email: "henriquecidoz@hotmail.com",
      password: "123456",
      name: "Joabe Henrique"
    }

  def user_factory,
    do: %User{
      age: 22,
      address: "Rua Paulista 20º",
      cep: "12345678",
      cpf: "12345678900",
      email: "henriquecidoz@hotmail.com",
      password: "123456",
      name: "Joabe Henrique",
      id: "13691c3b-3a27-4a19-bd1a-48f350bfb080"
    }
end
