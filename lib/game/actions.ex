defmodule Game.Actions do

  def fetch_move(move) do
    ExMon.Game.player()
    |> Map.get(:moves)
    |> find_move(move)
    |> IO.inspect()
  end

  def find_move(moves, move) do
    Enum.find(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end

  def attack({:ok, :avg}), do: "Causou 18 a 25 de dano"
  def attack({:ok, :rnd}), do: "Causou 10 a 32 de dano"
  def attack({:ok, :heal}), do: "Curou 18 a 25 de vida"
end
