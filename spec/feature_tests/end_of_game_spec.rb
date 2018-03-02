require 'game'

describe 'game over' do
  let(:grid) { Grid }
  let(:move) { Move }
  let(:game) { Game.new(grid, move) }

  before do
    game.new_game
  end

  it 'ends game when all spaces in grid are full' do
    fill_game
    expect { game.add_move(2, 2) }.to raise_error 'Game over'
    expect(game.grid.show).to eq [['X', 'O', 'X'],
                                  ['O', 'X', 'O'],
                                  ['X', 'O', 'X']]
  end
end
