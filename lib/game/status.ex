defmodule ExMon.Game.Status do

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n===== Game started! =====\n")
    IO.inspect(info)
    IO.puts("-----------------------------")
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n===== It's #{player}'s turn! =====\n")
    IO.inspect(info)
    IO.puts("-----------------------------")
  end
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n===== GAME OVER =====\n")
    IO.puts("\n===== #{Map.get(info, :turn)} WINS! =====\n")
    IO.inspect(info)
    IO.puts("-----------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n===== Invalid move: #{move}! =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n===== Player attacked Computer dealing #{damage} damage! =====\n")
  end
  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== Computer attacked Player dealing #{damage} damage! =====\n")
  end

end
