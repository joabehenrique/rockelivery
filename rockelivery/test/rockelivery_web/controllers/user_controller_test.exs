defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory
  import Mox

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when are params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 22,
        "address" => "Rua Paulista 20º",
        "cep" => "12345678",
        "cpf" => "12345678900",
        "email" => "henriquecidoz@hotmail.com",
        "password" => "123456",
        "name" => "Joabe Henrique"
      }

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok,
         %{
           "bairro" => "Sé",
           "cep" => "01001-000",
           "complemento" => "lado ímpar",
           "ddd" => "11",
           "gia" => "1004",
           "ibge" => "3550308",
           "localidade" => "São Paulo",
           "logradouro" => "Praça da Sé",
           "siafi" => "7107",
           "uf" => "SP"
         }}
      end)

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua Paulista 20º",
                 "age" => 22,
                 "cpf" => "12345678900",
                 "email" => "henriquecidoz@hotmail.com",
                 "id" => _id,
                 "name" => "Joabe Henrique"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "age" => 12,
        "cpf" => "123456789",
        "cep" => "29163172"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["must be greater than or equal to 18"],
          "cpf" => ["should be 11 character(s)"],
          "email" => ["can't be blank"],
          "name" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "13691c3b-3a27-4a19-bd1a-48f350bfb080"

      response =
        conn
        |> delete(Routes.user_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
