defmodule Rockelivery.User.Actions.Update do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.User.User

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, _uuid} -> validate_user_found(params)
    end
  end

  defp validate_user_found(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
