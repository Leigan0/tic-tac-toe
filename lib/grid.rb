class Grid
  def initialize(width, length)
    @grid = Array.new(width) { Array.new length }
  end

  def show
    grid.dup
  end

  def update_field(move)
    @move = move
    fail 'Outside Grid' unless within_grid
    fail 'Already taken' unless field_empty
    @grid[move[:y]][move[:x]] = move[:turn]
  end

  def full?
    !grid.flatten.include?(nil)
  end

  private
  attr_reader :move
  attr_reader :grid

  def within_grid
    move[:y] < grid.length && move[:x] < grid[0].length
  end

  def field_empty
    grid[move[:y]][move[:x]].nil?
  end

end
