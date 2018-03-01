require 'move'

describe Move do
  it 'will not allow a move with one co-ordinates to be created' do
    expect { Move.new(0) }.to raise_error 'wrong number of arguments (given 1, expected 3)'
  end
  it 'will not allow a move without an type argument to be created' do
    expect { Move.new(0,0) }.to raise_error 'wrong number of arguments (given 2, expected 3)'
  end
  describe '#to_s' do
    it 'returns move attributes as string' do
      move = Move.new(0,0,'X')
      expect(move.to_s).to eq '0,0,X'
    end
  end
end
