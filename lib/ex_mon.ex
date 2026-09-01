defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Dragon"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> Player.build(:slash, :breath, :regen)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    Actions.fetch_move(move)
    |> IO.inspect()
    |> execute_move()
  end

  def execute_move({:ok, move}), do: Actions.attack(move)
  def execute_move({:error, move}), do: "#{move} is an invalid attack."
end
