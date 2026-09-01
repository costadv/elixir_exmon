defmodule ExMon.Player do
  @enforce_keys [:name, :life, :moveAvg, :moveRnd, :moveHeal]
  defstruct [:name, :life, :moveAvg, :moveRnd, :moveHeal]
end
