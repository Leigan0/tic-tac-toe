class Game
  require_relative 'grid'
  require_relative 'move'
  attr_reader :grid, :turn

  GRID_SIZE = 3

  def initialize(grid_class = Grid, move_class = Move)
    @grid_class = grid_class
    @move_class = move_class
    @turn = 'X'
  end

  def new_game
    @grid = @grid_class.new(GRID_SIZE, GRID_SIZE)
  end

  def add_move(x, y)
    @move = @move_class.new(x, y, current_turn)
    @grid.update_field(@move.to_h)
    update_turn
  end

  def current_turn
    @turn
  end


  ## should turn be its own class?
  ## rules be its own class?

  private

  def update_turn
    fail 'Game over' if @grid.full?
    @turn == 'X' ? @turn = 'O' : @turn = 'X'
  end

end
