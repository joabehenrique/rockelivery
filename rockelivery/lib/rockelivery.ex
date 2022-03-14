defmodule Rockelivery do
  alias Rockelivery.User.Actions.Create, as: UserCreate
  alias Rockelivery.User.Actions.Delete, as: UserDelete
  alias Rockelivery.User.Actions.Find, as: UserFind

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate find_user_by_id(params), to: UserFind, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
end
