require 'game'

describe Game do
  let(:move) { double :move, to_h: nil }
  let(:move_class) { double :move_class, new: move }
  let(:grid) { double :grid, update_field: nil }
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
  end
end
