require'./bin/main'


describe Board do
describe ".validate_name" do
  it "validates the players names" do
    expect(Board.validate_name("al")).to eq(false)
  end
end 
end 

  include Logic
  describe "#calc_tak_turns" do
    it "calculates the plyer turns" do
      expect(calc_tak_turns = Array.new()).to eq([])
    end
  end

  describe "#test_move" do 

    it "tests returns flase if the given number betwen 1 and 9" do
      @tak_turns = [1, 2, 3]
      expect(test_move(4)).to eq(true)
    end

    it "tests returns flase if the given number betwen 1 and 9 and included in the give arr" do
      @tak_turns = [1, 2, 3]
      expect(test_move(3)).to eq(false)
    end

    it "return false if a number is not an integer" do
      expect(test_move("str")).to eq(false)
    end
    it "return false if a number given greater than 9" do
      expect(test_move(10)).to eq(false)
    end

    it "return false if a number given less than 1" do
      expect(test_move(0)).to eq(false)
    end
  end

  describe "#wining" do
    it "returns true if the players turn array matches one of the winning options" do
      @winning_options = [[1,2,3], [4,5,6]]
      @player1_trn = [1,2,3]
      @player2_trn = [4,5]
      expect(@winning_options[0] - @player1_trn).to eq([])
    end
  end