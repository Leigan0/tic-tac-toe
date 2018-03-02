require 'grid'

describe Grid do

  describe '#show' do
    it 'returns a grid to to dimensions given' do
      grid = Grid.new(3, 3)
      expect(grid.show).to eq [[nil, nil, nil],
                               [nil, nil, nil],
                               [nil, nil, nil]]
    end
    it 'returns a grid to to dimensions given' do
      grid = Grid.new(4, 4)
      expect(grid.show).to eq [[nil, nil, nil, nil],
                               [nil, nil, nil, nil],
                               [nil, nil, nil, nil],
                               [nil, nil, nil, nil]]
    end
  end

  describe '#update_field' do
    let(:grid) { described_class.new(3, 3) }
    context 'updating an empty field' do
      it 'will update an empty selected space in grid' do
        grid.update_field({ :turn => "X", :x => 1, :y => 0 })
        expect(grid.show).to eq [[nil, 'X', nil],
                                 [nil, nil, nil],
                                 [nil, nil, nil]]
      end
      it 'will update edge fields' do
        grid.update_field({ :turn => "X", :x => 2, :y => 2 })
        expect(grid.show).to eq [[nil, nil, nil],
                                 [nil, nil, nil],
                                 [nil, nil, 'X']]
      end
    end
    context 'update an invalid field' do
      it 'will raise error if y field is outside grid' do
        expect { grid.update_field({ :turn => "X", :x => 0,
                                      :y => 3 })
        }.to raise_error 'Outside Grid'
      end
      it 'will raise error if  x field is outside grid' do
        expect { grid.update_field({
                                    :turn => "X", :x => 3,
                                    :y => 0 })
        }.to raise_error 'Outside Grid'
      end
      it 'will raise error if field selected is not nil' do
        grid.update_field({ :turn => "X", :x => 0, :y => 2 })
        expect { grid.update_field({
                                    :turn => "X", :x => 0,
                                    :y => 2 })
        }.to raise_error 'Already taken'
      end
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

  describe '#repeating_pattern' do
    let(:grid) { described_class.new(3, 3) }
    context 'repeating horizontal pattern' do
      it 'can confirm true if repeating pattern in first row horizontal' do
        three_in_row_horizontal(0)
        expect(grid.repeating_pattern).to eq true
      end
      it 'can confirm true if repeating pattern in second row horizontal' do
        three_in_row_horizontal(1)
        expect(grid.repeating_pattern).to eq true
      end
      it 'can confirm true if repeating pattern in second row horizontal' do
        three_in_row_horizontal(1)
        expect(grid.repeating_pattern).to eq true
      end
      it 'can confirm true if repeating pattern if multiple other fields in grid' do
        three_in_row_horizontal(0)
        grid.update_field({ :turn => "O", :x => 2, :y => 1 })
        grid.update_field({ :turn => "O", :x => 2, :y => 2 })
        expect(grid.repeating_pattern).to eq true
      end
    end
    context 'repeating vertical pattern' do
      it 'can confirm true if repeating pattern in first row vertical' do
        three_in_row_vertical(0)
        expect(grid.repeating_pattern).to eq true
      end
      it 'can confirm true if repeating pattern in second row vertical' do
        three_in_row_vertical(1)
        expect(grid.repeating_pattern).to eq true
      end
      it 'can confirm true if repeating pattern in second row vertical' do
        three_in_row_vertical(2)
        expect(grid.repeating_pattern).to eq true
      end
    end
  end

end
