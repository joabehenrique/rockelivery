defmodule RockeliveryWeb.ItemView do
  use RockeliveryWeb, :view
  alias Rockelivery.Item.Item

  def render("create.json", %{Item: item}) do
    %{
      message: "Item created",
      item: item
    }
  end
end
