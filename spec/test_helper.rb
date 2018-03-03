def fill_game
  game.add_move(0, 0)
  game.add_move(0, 1)
  game.add_move(0, 2)
  game.add_move(1, 0)
  game.add_move(1, 2)
  game.add_move(1, 1)
  game.add_move(2, 0)
  game.add_move(2, 2)
end

def three_in_a_row_h
  game.add_move(0, 0)
  game.add_move(2, 1)
  game.add_move(1, 0)
  game.add_move(1, 1)
  game.add_move(2, 0)
end

def three_in_row_v
  game.add_move(1, 0)
  game.add_move(2, 1)
  game.add_move(1, 2)
  game.add_move(0, 1)
  game.add_move(1, 1)
end

def three_in_row_d_left
  game.add_move(0, 0)
  game.add_move(2, 1)
  game.add_move(1, 1)
  game.add_move(0, 1)
  game.add_move(2, 2)
end

def three_in_row_d_right
  game.add_move(2, 0)
  game.add_move(2, 1)
  game.add_move(1, 1)
  game.add_move(0, 1)
  game.add_move(0, 2)
end

def three_in_row_vertical(num)
  grid.update_field({ :turn => "X", :x => num, :y => 0 })
  grid.update_field({ :turn => "X", :x => num, :y => 1 })
  grid.update_field({ :turn => "X", :x => num, :y => 2 })
end

def three_in_row_horizontal(num)
  grid.update_field({ :turn => "X", :x => 0, :y => num })
  grid.update_field({ :turn => "X", :x => 1, :y => num })
  grid.update_field({ :turn => "X", :x => 2, :y => num })
end

def three_in_row_diagonal_left
  grid.update_field({ :turn => "X", :x => 2, :y => 2 })
  grid.update_field({ :turn => "X", :x => 1, :y => 1 })
  grid.update_field({ :turn => "X", :x => 0, :y => 0 })
end

def three_in_row_diagonal_right
  grid.update_field({ :turn => "X", :x => 2, :y => 0 })
  grid.update_field({ :turn => "X", :x => 1, :y => 1 })
  grid.update_field({ :turn => "X", :x => 0, :y => 2 })
end
