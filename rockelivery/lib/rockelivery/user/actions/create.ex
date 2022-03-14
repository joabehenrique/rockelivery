defmodule Rockelivery.User.Actions.Create do
  alias Rockelivery.Repo
  alias Rockelivery.User.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, %{status: :bad_request, result: result}}
end
