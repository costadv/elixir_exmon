defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Actions.{Heal, Attack}

  def fetch_move(move) do
    ExMon.Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  def find_move(moves, move) do
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end

  #def attack(:avg), do: "Dano médio! Causou 18 a 25 de dano"
  #def attack(:rnd), do: "Dano Aleatório! Causou 10 a 32 de dano"
  #def attack(:heal), do: "Cura! Curou 18 a 25 de vida"
  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack_opponent(:computer, move)
      :computer -> Attack.attack_opponent(:player, move)
    end

  end

  def heal() do
    case Game.turn() do
      :player -> Heal.heal_self(:player)
      :computer -> Heal.heal_self(:computer)
    end

  end

end
