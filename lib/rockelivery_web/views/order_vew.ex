defmodule RockeliveryWeb.OrderView do
  use RockeliveryWeb, :view

  alias Rockelivery.Order.Order

  def render("create.json", %{Order: order}) do
    %{
      message: "Order created",
      order: order
    }
  end
end
