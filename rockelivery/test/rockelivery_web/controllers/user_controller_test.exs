defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true
  import Rockelivery.Factory

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
        "cpf" => "123456789"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["must be greater than or equal to 18"],
          "cep" => ["can't be blank"],
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
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "13691c3b-3a27-4a19-bd1a-48f350bfb080"
      insert(:user)

      response =
        conn
        |> delete(Routes.user_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
