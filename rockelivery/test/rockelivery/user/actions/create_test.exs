defmodule Rockelivery.User.CreateTest do
  use Rockelivery.DataCase
  import Rockelivery.Factory
  alias Rockelivery.Error
  alias Rockelivery.User.User
  alias Rockelivery.User.Actions.Create

  describe "call/1" do
    test "when all params is valid, return the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 22, email: "henriquecidoz@hotmail.com"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 12, cpf: "123456789"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cpf: ["should be 11 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
