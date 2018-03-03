class Grid
  def initialize(w, l)
    @width = w
    @length = l
    @grid = Array.new(width) { Array.new length }
  end

  def show
    grid.dup
  end

  def update_field(coordinates)
    @coordinates = coordinates
    validate_field
    grid[coordinates[:y]][coordinates[:x]] = coordinates[:turn]
  end

  def full?
    !grid.flatten.include?(nil)
  end

  def repeating_pattern
    diagnonal_right || vertical_rows || horizontal_rows || diagonal_left
  end

  private
  attr_reader :coordinates
  attr_reader :grid
  attr_reader :width
  attr_reader :length

  def diagonal_left
    repeating_patterns([(0..(length - 1)).collect { |ind| grid[ind][ind] }])
  end

  def diagnonal_right
    i = length
    repeating_patterns([grid.map { |row| row[i -= 1] }])
  end

  def repeating_patterns(rows)
    pattern = false
    rows.each do |row|
      unless row.include?(nil)
        pattern = true if row.uniq.length == 1
      end
    end
    pattern
  end

  def vertical_rows
    repeating_patterns(grid.transpose.each { |row| })
  end

  def horizontal_rows
    repeating_patterns(grid.each { |row| })
  end

  def validate_field
    fail 'Outside Grid' unless within_grid
    fail 'Already taken' unless field_empty
  end

  def within_grid
    coordinates[:y] < length && coordinates[:x] < width
  end

  def field_empty
    grid[coordinates[:y]][coordinates[:x]].nil?
  end

end
