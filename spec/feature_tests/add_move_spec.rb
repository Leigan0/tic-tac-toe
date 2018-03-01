require 'game'

describe 'adds move' do
  let(:grid) { Grid }
  let(:move) { Move }
  let(:game) { Game.new(grid, move) }

  before do
    game.new_game
  end

  it 'adds first move as X, second move as O' do
    game.add_move(0, 0)
    game.add_move(0, 1)
    expect(game.grid.show).to eq [['X', nil, nil], ['O', nil, nil], [nil, nil, nil]]
  end
  it 'will not add move if intergers are not given as x & y arguments' do
    expect { game.add_move('X', 'Y') }.to raise_error { 'not a valid move' }
    expect(game.grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end
  it 'will not add move if space selected is taken' do
    game.add_move(2, 2)
    expect(game.grid.show).to eq [[nil, nil, nil], [nil, nil, nil], [nil, nil, 'X']]
    expect { game.add_move(2, 2) }.to raise_error { 'Already taken' }
  end
  it 'will not add move if space selected is not within grid' do
    expect { game.add_move(4, 4) }.to raise_error { 'Outside Grid' }
  end
  it 'will not change player turn if selected space not available to select' do
    expect(game.turn).to eq 'X'
    expect { game.add_move(4, 4) }.to raise_error { 'Outside Grid' }
    expect(game.turn).to eq 'X'
    game.add_move(0, 2)
    expect(game.turn).to eq 'O'
    expect { game.add_move(0, 2) }.to raise_error { 'Already taken' }
    expect(game.turn).to eq 'O'
  end
end
