defmodule Rockelivery.Order.Report do
  import Ecto.Query

  alias Rockelivery.Item.Item
  alias Rockelivery.Order.Order
  alias Rockelivery.Order.TotalPrice
  alias Rockelivery.Repo

  @default_block_size 500

  def create(filename \\ "report.csv") do
    query = from(order in Order, order_by: order.user_id)

    {:ok, order_list} =
      Repo.transaction(
        fn ->
          query
          |> Repo.stream(max_rows: @default_block_size)
          |> Stream.chunk_every(@default_block_size)
          |> Stream.flat_map(fn chunk -> Repo.preload(chunk, :items) end)
          |> Enum.map(&parse_line/1)
        end,
        timeout: :infinity
      )

    File.write(filename, order_list)
  end

  defp parse_line(%Order{user_id: user_id, payment_method: payment_method, items: items}) do
    total_price = TotalPrice.calculate(items)
    items_string = Enum.map(items, fn item -> items_string(item) end)

    "#{user_id}, #{payment_method}, #{items_string} #{total_price}\n"
  end

  defp items_string(%Item{category: category, description: description, price: price}) do
    "#{category}, #{description}, #{price},"
  end
end
