require 'game'

describe 'Start new game' do
  let(:grid) { Grid }
  let(:move) { Move }
  let(:game) { Game.new(grid, move) }

  it 'creates a 3*3 grid by default' do
    game.new_game
    expect(game.grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end
end
