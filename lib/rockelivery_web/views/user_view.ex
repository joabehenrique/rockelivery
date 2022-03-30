defmodule RockeliveryWeb.UserView do
  use RockeliveryWeb, :view
  alias Rockelivery.User.User

  def render("create.json", %{user: %User{} = user, token: token}) do
    %{
      message: "User created",
      user: user,
      token: token
    }
  end

  def render("show.json", %{user: %User{} = user}) do
    %{
      message: "User found",
      user: user
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end

  def render("update.json", %{user: %User{} = user}) do
    %{
      message: "User updated",
      user: user
    }
  end
end
