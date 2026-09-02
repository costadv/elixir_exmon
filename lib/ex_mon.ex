defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Dragon"
  @computer_move_list [:avg, :rnd, :heal, :avg, :rnd, :avg]

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> Player.build(:avg, :rnd, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())

    if Map.get(Game.info(), :turn) == :computer, do: make_computer_move(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move(Game.info())

    make_computer_move(Game.info())
  end

  defp make_computer_move(%{status: :game_over}), do: ""
  defp make_computer_move(%{turn: :computer}) do
    move = {:ok, fetch_computer_move()}
    do_move(move, Game.info())
  end

  defp fetch_computer_move() do
    #chance = Enum.random(0..99)
    #cond do
    #  chance < 40 -> :avg
    #  chance > 39 and chance < 70 -> :rnd
    #  chance > 69 -> :heal
    #  true -> :avg
    #end
    Enum.random(@computer_move_list)
  end

  defp do_move(_, %{status: :game_over}), do: Status.print_round_message(Game.info())
  defp do_move({:error, move}, _), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}, _) do
    case move do
      :heal -> Actions.heal()
      move -> Actions.attack(move)
    end
    Status.print_round_message(Game.info())
  end

end
