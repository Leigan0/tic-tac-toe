require 'grid'

describe Grid do
  it 'will not allow a grid with one arg to be created' do
    expect { Grid.new(0) }.to raise_error 'wrong number of arguments (given 1, expected 2)'
  end
  describe '#show' do
    it 'returns a grid to to dimensions given' do
      grid = Grid.new(3, 3)
      expect(grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    end
    it 'returns a grid to to dimensions given' do
      grid = Grid.new(4, 4)
      expect(grid.show).to eq [[nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil]]
    end
  end
end
