require'./bin/main'


describe Board do
describe ".validate_name" do
  it "validates the players names" do
    expect(Board.validate_name("al")).to eq(false)
  end
end 
end 

describe Logic do
  include Logic
  describe "#calc_tak_turns" do
    it "calculates the plyer turns" do
      expect(calc_tak_turns = Array.new()).to eq([])
    end
  end

  describe "#test_move" do 
    it "tests each players move" do
      @tak_turns = [1, 2, 3]
      expect(test_move(4)).to eq(true)
    end
  end
end
 