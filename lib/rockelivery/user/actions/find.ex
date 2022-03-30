defmodule Rockelivery.User.Actions.Find do
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.User.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
