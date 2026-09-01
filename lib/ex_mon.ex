defmodule ExMon do
  alias ExMon.Player

  def createPlayer(name, moveAvg, moveRnd, moveHeal) do
    Player.build(name, moveAvg, moveRnd, moveHeal)
  end
end
