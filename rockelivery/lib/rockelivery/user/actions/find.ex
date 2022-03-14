defmodule Rockelivery.User.Actions.Find do
  alias Ecto.UUID
  alias Rockelivery.Repo
  alias Rockelivery.User.User

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> get_by_id(uuid)
    end
  end

  defp get_by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> {:ok, user}
    end
  end
end
