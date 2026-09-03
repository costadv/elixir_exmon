defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game
  alias ExMon.Game.Status

  @mheal_power 18..25

  def heal_self(player) do
    heal = Enum.random(@mheal_power)

    IO.puts("!!! HEAL !!!\n")

    player
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(heal)
    |> update_self_life(player, heal)

  end

  defp calculate_total_life(life, heal) when life + heal > 100, do: 100
  defp calculate_total_life(life, heal), do: life + heal

  defp update_self_life(life, player, heal) do
    player
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(player, heal)
  end

  defp update_game(updated_player, player, heal) do
    Game.info()
    |> Map.put(player, updated_player)
    |> Game.update()

    Status.print_move_message(player, :heal, heal)
  end
end
