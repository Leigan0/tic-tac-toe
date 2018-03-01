class Move
  def initialize(p1,p2,turn)
    @position1 = p1
    @position2 = p2
    @turn = turn
  end

  def to_s
    "#{@position1},#{@position2},#{@turn}"
  end
end
