module Logic

  def calc_tak_turns
    @tak_turns = @player1_trn + @player2_trn
  end

  def test_move(player_input)
    if (1..9).none? { |accepted_i| accepted_i == player_input.to_i }
      false
    elsif @tak_turns.any? { |tak_turn| tak_turn == player_input.to_i }
      false
    else
      true
    end
  end
end
