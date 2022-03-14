defmodule Rockelivery.User.Actions.Delete do
  alias Ecto.UUID
  alias Rockelivery.Repo
  alias Rockelivery.User.User

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> Repo.delete(user)
    end
  end
end
