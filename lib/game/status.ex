defmodule ExMon.Game.Status do

  def print_round_message(%{status: :started, turn: player} = info) do
    IO.puts("===== Game started! =====\n")
    IO.puts("===== It's #{player}'s turn! =====\n")
    #IO.inspect(info)
    IO.puts("#{short_game_info(info)}\n")
    IO.puts("-----------------------------")
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    #IO.inspect(info)
    IO.puts("#{short_game_info(info)}\n")
    IO.puts("===== It's #{player}'s turn! =====\n")
    IO.puts("-----------------------------")
  end
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("===== GAME OVER =====\n")
    IO.puts("===== #{Map.get(info, :turn)} WINS! =====\n")
    #IO.inspect(info)
    IO.puts("#{short_game_info(info)}\n")
    IO.puts("-----------------------------")
  end

  defp short_game_info(info) do
    player_name = info
    |> Map.get(:player)
    |> Map.get(:name)
    |> to_string()

    player_life = info
    |> Map.get(:player)
    |> Map.get(:life)
    |> to_string()

    computer_name = info
    |> Map.get(:computer)
    |> Map.get(:name)
    |> to_string()

    computer_life = info
    |> Map.get(:computer)
    |> Map.get(:life)
    |> to_string()

    message =
      "[Player: #{player_name} // life: #{player_life}]\n[Computer: #{computer_name} // life: #{computer_life}]"
    message
  end

  def print_wrong_move_message(move) do
    IO.puts("===== Invalid move: #{move}! =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("===== Player attacked Computer dealing #{damage} damage! =====\n")
  end
  def print_move_message(:player, :attack, damage) do
    IO.puts("===== Computer attacked Player dealing #{damage} damage! =====\n")
  end
  def print_move_message(:player, :heal, heal) do
    IO.puts("===== Player healed #{heal} of their life! =====\n")
  end
  def print_move_message(:computer, :heal, heal) do
    IO.puts("===== Computer healed #{heal} of their life! =====\n")
  end

end
