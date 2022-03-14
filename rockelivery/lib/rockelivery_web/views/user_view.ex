defmodule RockeliveryWeb.UserView do
  use RockeliveryWeb, :view
  alias Rockelivery.User.User

  def render("create_user.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: user
    }
  end
end
