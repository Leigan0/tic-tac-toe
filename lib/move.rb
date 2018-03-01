class Move
  def initialize(x, y, turn)
    @x = x
    @y = y
    @turn = turn
    validate!
  end

  def to_h
    { x: @x, y: @y, turn: @turn }
  end

  private

  def validate!
    fail 'not a valid move' unless @x.is_a?(Integer) && @y.is_a?(Integer)
  end
end
