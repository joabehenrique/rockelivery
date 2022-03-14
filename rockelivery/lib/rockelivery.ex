defmodule Rockelivery do
  alias Rockelivery.User.Actions.Create, as: UserCreate
  alias Rockelivery.User.Actions.Find, as: UserFind

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate find_user_by_id(params), to: UserFind, as: :call
end
