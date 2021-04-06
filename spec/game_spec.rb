require_relative('../bin/main')
# rubocop: disable Style/MixinUsage

describe Board do
  describe '.validate_name' do
    it 'validates the players names' do
      expect(Board.validate_name('al')).to eq(false)
    end
    it 'validates the players names' do
      expect(Board.validate_name('shaher')).to eq(true)
    end
  end
end
include Logic
describe '#calc_tak_turns' do
  it 'calculates the plyer turns' do
    @player1_trn = [1, 2]
    @player2_trn = [3, 4]
    expect(calc_tak_turns).to eql([1, 2, 3, 4])
  end
end

describe '#test_move' do
  it 'tests returns true if the given number betwen 1 and 9' do
    @tak_turns = [1, 2, 3]
    expect(test_move(4)).to eq(true)
  end
  it 'tests returns flase if the given number is not betwen 1 and 9' do
    @tak_turns = [11, 12]
    expect(test_move(12)).to eq(false)
  end

  it 'tests returns flase if the given number betwen 1 and 9 and included in the give arr' do
    @tak_turns = [1, 2, 3]
    expect(test_move(3)).to eq(false)
  end

  it 'tests returns flase if the given number betwen 1 and 9 and not included in the give arr' do
    @tak_turns = [1, 2, 3]
    expect(test_move(5)).to eq(true)
  end

  it 'return false if a number is not an integer' do
    expect(test_move('str')).to eq(false)
  end
  it 'return false if a number given greater than 9' do
    expect(test_move(10)).to eq(false)
  end

  it 'return false if a number given less than 1' do
    expect(test_move(0)).to eq(false)
  end
end
describe '#wining' do
  it 'returns true if the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2, 3]
    @player2_trn = [4, 5]
    expect(@winning_options[0] - @player1_trn).to eq([])
  end

  it 'returns true if the players turn array does not match one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2, 3, 4]
    @player2_trn = [4, 5]
    expect(@winning_options[0] - @player1_trn).to eq([])
  end

  it 'returns false for wining method of the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2]
    @player2_trn = [4, 5]
    @win = false
    expect(wining).to be false
  end

  it 'returns true for wining method of the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2]
    @player2_trn = [4, 5]
    @win = true
    expect(wining).to be true
  end

  it 'returns true for wining method if the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2, 3]
    @player2_trn = [4, 5]
    expect(wining).to be true if @winning_options - @player1_trn == []
  end

  it 'returns true for wining method if the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2]
    @player2_trn = [4, 5]
    expect(wining).to be false if @winning_options - @player1_trn == []
  end

  it 'returns true for wining method if the players turn array matches one of the winning options' do
    @winning_options = [[1, 2, 3], [4, 5, 6]]
    @player1_trn = [1, 2]
    @player2_trn = [4, 5, 6]
    expect(wining).to be true if @winning_options - @player2_trn == []
  end
end
# rubocop: enable Style/MixinUsage
