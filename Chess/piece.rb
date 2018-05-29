class Piece
  attr_reader :color, :pos, :board
  def initialize(color = nil, board = nil, pos = nil)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    return []
  end

  def to_s
    return " " 
  end

end
