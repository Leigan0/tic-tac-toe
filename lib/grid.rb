class Grid
  def initialize(width, length)
    @grid = Array.new(width) { Array.new length }
  end

  def show
    grid.dup
  end

  def update_field(coordinates)
    @coordinates = coordinates
    validate_field
    @grid[coordinates[:y]][coordinates[:x]] = coordinates[:turn]
  end

  def full?
    !grid.flatten.include?(nil)
  end

  private
  attr_reader :coordinates
  attr_reader :grid

  def validate_field
    fail 'Outside Grid' unless within_grid
    fail 'Already taken' unless field_empty
  end

  def within_grid
    coordinates[:y] < grid.length && coordinates[:x] < grid[0].length
  end

  def field_empty
    grid[coordinates[:y]][coordinates[:x]].nil?
  end

end
