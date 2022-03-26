defmodule Rockelivery.ViaCep.Client do
  use Tesla

  alias Rockelivery.Error
  alias Rockelivery.ViaCep.Behaviour
  alias Tesla.Env

  @base_url "https://viacep.com.br/ws/"
  @behaviour Behaviour

  plug Tesla.Middleware.JSON

  def get_cep_info(url \\ @base_url, cep) do
    "#{url}#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}),
    do: {:error, Error.build(:not_found, "CEP not found")}

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_get({:ok, %Env{status: 400, body: _body}}),
    do: {:error, Error.build(:bad_request, "Invalid CEP")}

  defp handle_get({:error, reason}),
    do: {:error, Error.build(:bad_request, reason)}
end
