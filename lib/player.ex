defmodule ExMon.Player do
  @enforce_keys [:name, :life, :moveAvg, :moveRnd, :moveHeal]
  defstruct [:name, :life, :moveAvg, :moveRnd, :moveHeal]

  def build(name, moveAvg, moveRnd, moveHeal) do
    %ExMon.Player{
      name: name,
      life: 100,
      moveAvg: moveAvg,
      moveRnd: moveRnd,
      moveHeal: moveHeal
  }
  end
end
