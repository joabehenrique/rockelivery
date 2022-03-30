defmodule Rockelivery.Order.ReportRunner do
  use GenServer

  require Logger

  alias Rockelivery.Order.Report

  def start_link(_initial_stack) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(stack) do
    Logger.info("ReportRunner started..")
    schedule_report_generation()

    {:ok, stack}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating report..")

    Report.create()
    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
