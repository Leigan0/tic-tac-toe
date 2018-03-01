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
  describe '#update_field' do
    let(:grid) { described_class.new(3, 3) }
    it 'will update an empty selected space in grid' do
      grid.update_field({ :turn => "X", :x => 1, :y => 0 })
      expect(grid.show).to eq [[nil, 'X', nil], [nil, nil, nil], [nil, nil, nil]]
    end
    it 'will update edge fields' do
      grid.update_field({ :turn => "X", :x => 2, :y => 2 })
      expect(grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, 'X']]
    end
    it 'will raise error if y field is outside grid' do
      expect { grid.update_field({ :turn => "X", :x => 0, :y => 3 }) }.to raise_error { 'Outside Grid' }
    end
    it 'will raise error if  x field is outside grid' do
      expect { grid.update_field({ :turn => "X", :x => 3, :y => 0 }) }.to raise_error { 'Outside Grid' }
    end
    it 'will raise error if field selected is not nil' do
      grid.update_field({ :turn => "X", :x => 0, :y => 2 })
      expect { grid.update_field({ :turn => "X", :x => 0, :y => 2 }) }.to raise_error { 'Already taken' }
    end
  end

  it 'knows when grid has no more nil entries' do
    grid = Grid.new(2, 2)
    grid.update_field({ :turn => "1", :x => 0, :y => 0 })
    grid.update_field({ :turn => "2", :x => 1, :y => 0 })
    grid.update_field({ :turn => "3", :x => 0, :y => 1 })
    grid.update_field({ :turn => "4", :x => 1, :y => 1 })
    expect(grid).to be_full
  end

  it 'knows when grid has nil entries' do
    grid = Grid.new(2, 2)
    expect(grid).not_to be_full
  end

end
