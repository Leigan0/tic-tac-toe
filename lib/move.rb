class Move
  def initialize(x, y, turn)
    @x = x
    @y = y
    @turn = turn
  end

  def to_h
    { x: @x, y: @y, turn: @turn }
  end
end
