defmodule ExMon.Player do
  @requiredKeys [:name, :life, :moveAvg, :moveRnd, :moveHeal]
  @maxLife 100

  @enforce_keys @requiredKeys
  defstruct @requiredKeys

  def build(name, moveAvg, moveRnd, moveHeal) do
    %ExMon.Player{
      name: name,
      life: @maxLife,
      moveAvg: moveAvg,
      moveRnd: moveRnd,
      moveHeal: moveHeal
  }
  end
end
