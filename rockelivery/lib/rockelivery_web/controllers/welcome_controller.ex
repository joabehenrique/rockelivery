defmodule RockeliveryWeb.WelcomeController do
  use RockeliveryWeb, :controller

  def index(conn, params) do
    IO.inspect(params, label: "RESULTADO DO PARAMS: ")

    conn
    |> put_status(:ok)
    |> text("Ola, teste")
  end
end
