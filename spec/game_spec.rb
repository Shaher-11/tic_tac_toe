require'./bin/main'

describe Board do
describe ".validate_name" do
  it "validates the players names" do
    expect(Board.validate_name("al")).to eq(false)
  end
end 
end 

  describe "#calc_tak_turns" do
    it "calculates the plyer turns" do
      expect(calc_tak_turns = Array.new()).to eq([])
    end
  end
 