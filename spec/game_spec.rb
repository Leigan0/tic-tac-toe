require 'game'

describe Game do
  let(:move) { double :move, to_h: nil }
  let(:move_class) { double :move_class, new: move }
  let(:grid) {  double :grid, update_field: nil, full?: false,
                repeating_pattern: false
  }
  let(:grid_class) { double :grid_class, new: grid }
  let(:game) { described_class.new(grid_class, move_class) }

  it 'creates a new game grid' do
    game.new_game
    expect(grid_class).to have_received(:new)
  end

  describe 'add_move' do
    before do
      game.new_game
      game.add_move(0, 1)
    end
    it 'creates a new move object' do
      expect(move_class).to have_received(:new).with(0, 1, 'X')
    end
    it 'changes current turn after successful move' do
      game.add_move(0, 0)
      expect(move_class).to have_received(:new).with(0, 1, 'X')
      expect(move_class).to have_received(:new).with(0, 0, 'O')
    end
    it 'calls update_field on grid class' do
      expect(grid).to have_received(:update_field)
    end
    it 'will not add another move if grid is full' do
      allow(grid).to receive(:full?).and_return(true)
      expect { game.add_move(2, 2) }.to raise_error 'Game over'
    end
    it 'raises error game over when line repeating pattern found' do
      allow(grid).to receive(:repeating_pattern).and_return(true)
      expect { game.add_move(2, 2) }.to raise_error 'Game over'
    end
  end
end
