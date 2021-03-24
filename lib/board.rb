class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def self.validate_name(name)
    name.length > 3
  end
end
