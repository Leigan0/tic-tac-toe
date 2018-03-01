class Grid
  def initialize(width, length)
    @grid = Array.new(width) { Array.new length }
  end

  def show
    @grid
  end

  def update_field(move)
    fail 'Outside Grid' unless move[:y] < @grid.length && move[:x] < @grid[0].length
    fail 'Already taken' unless @grid[move[:y]][move[:x]] == nil
    @grid[move[:y]][move[:x]] = move[:turn]
  end
end
