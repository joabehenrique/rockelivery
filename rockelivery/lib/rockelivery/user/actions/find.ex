defmodule Rockelivery.User.Actions.Find do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.User.User

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get_by_id(uuid)
    end
  end

  defp get_by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
