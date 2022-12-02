defmodule LiveryWeb.ViaCep.Client do
  use Tesla
  alias Tesla.Env
  
  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  def get_cep_info(cep) do 
    "#{cep}/json"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"error" => true}}}) do
    {:error, "Cep not found"}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_get({:ok, %Env{status: 400}}) do
    {:error, "Not found"}
  end

  defp handle_get({:error, reason}) do
    {:error, reason}
  end
  
end
