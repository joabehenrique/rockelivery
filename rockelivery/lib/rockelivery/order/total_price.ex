defmodule Rockelivery.Order.TotalPrice do
  alias Rockelivery.Item.Item

  def calculate(items) do
    Enum.reduce(items, Decimal.new("0.00"), fn item, acc -> sum_price(item, acc) end)
  end

  defp sum_price(%Item{price: price}, acc), do: Decimal.add(price, acc)
end
