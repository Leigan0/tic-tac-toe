require 'game'

describe 'adds move' do
  let(:grid) { Grid }
  let(:move) { Move }
  let(:game) { Game.new(grid, move) }

  it 'adds first move as X, second move as O' do
    game.new_game
    game.add_move(0, 0)
    game.add_move(0, 1)
    expect(game.grid.show).to eq [['X', nil, nil], ['O', nil, nil], [nil, nil, nil]]
  end
  it 'will not add move if space selected is taken' do
    game.new_game
    game.add_move(2, 2)
    expect(game.grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, 'X']]
    expect { game.add_move(2,2) }.to raise_error { 'Already taken' }
  end
  it 'will not add move if space selected is not within grid' do
    game.new_game
    expect { game.add_move(4,4) }.to raise_error { 'Outside Grid' }
  end
end
