require 'game'

describe 'game over' do
  let(:grid) { Grid }
  let(:move) { Move }
  let(:game) { Game.new(grid, move) }

  before do
    game.new_game
  end

  it 'ends game when all spaces in grid are full and no three in a row' do
    fill_game
    expect { game.add_move(2, 1) }.to raise_error 'Game over'
    expect(game.grid.show).to eq [['X', 'O', 'X'],
                                  ['O', 'O', 'X'],
                                  ['X', 'X', 'O']]
  end

  it 'ends a game when three in a row horizontal' do
    expect { three_in_a_row_h }.to raise_error 'Game over'
    expect(game.grid.show).to eq [["X", "X", "X"],
                                   [nil, "O", "O"],
                                   [nil, nil, nil]]
    expect(game).to be_gameover
  end

  it 'ends a game when three in a row vertical' do
    expect { three_in_row_v }.to raise_error 'Game over'
    expect(game.grid.show).to eq [[nil, "X", nil],
                                   ["O", "X", "O"],
                                   [nil, "X", nil]]
    expect(game).to be_gameover
  end

  it 'ends a game when three in a row diagnonal' do
    expect { three_in_row_d_left }.to raise_error 'Game over'
    expect(game.grid.show).to eq [["X", nil, nil],
                                   ["O", "X", "O"],
                                   [nil, nil, "X"]]
    expect(game).to be_gameover
  end
  it 'ends a game when three in a row diagnonal' do
    expect { three_in_row_d_right }.to raise_error 'Game over'
    expect(game.grid.show).to eq [[nil, nil, "X"],
                                   ["O", "X", "O"],
                                   ["X", nil, nil]]
    expect(game).to be_gameover
  end
end
