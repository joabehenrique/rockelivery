defmodule Rockelivery.User.Actions.Create do
  alias Rockelivery.Repo
  alias Rockelivery.User.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
