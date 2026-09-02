defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Dragon"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> Player.build(:avg, :rnd, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end
  def make_computer_move() do
    move = Actions.fetch_computer_move()
    do_move({:ok, move})
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :heal -> Actions.heal()
      move -> Actions.attack(move)
    end
    Status.print_round_message(Game.info())
  end

end
