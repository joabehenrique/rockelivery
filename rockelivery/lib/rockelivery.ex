defmodule Rockelivery do
  alias Rockelivery.User.Actions.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
