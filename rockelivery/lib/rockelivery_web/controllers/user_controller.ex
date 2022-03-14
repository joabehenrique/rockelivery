defmodule RockeliveryWeb.UserController do
  use RockeliveryWeb, :controller
  alias Rockelivery.User.User
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create_user.json", user: user)
    end
  end
end
