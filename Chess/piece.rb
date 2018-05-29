class Piece
  attr_reader :color, :pos, :board 
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    return []
  end

  def to_s
    return "P"
  end

end
