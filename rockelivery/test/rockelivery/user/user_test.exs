defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true
  import Rockelivery.Factory
  alias Ecto.Changeset
  alias Rockelivery.User.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Joabe Henrique"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      updated_params = %{name: "Joabe Carvalho"}

      response =
        params
        |> User.changeset()
        |> User.changeset(updated_params)

      assert %Changeset{changes: %{name: "Joabe Carvalho"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{age: 12, cep: "123456"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cep: ["should be 8 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
