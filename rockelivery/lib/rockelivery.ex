defmodule Rockelivery do
  alias Rockelivery.User.Actions.Create, as: UserCreate
  alias Rockelivery.User.Actions.Delete, as: UserDelete
  alias Rockelivery.User.Actions.Find, as: UserFind
  alias Rockelivery.User.Actions.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate find_user_by_id(params), to: UserFind, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
end
