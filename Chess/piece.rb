class Piece 
  attr_reader :color, :pos 
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

class Bishop < Piece
  include SlidingPiece
  
  def move_dirs
    :diagonal
  end
end

class Rook < Piece
  include SlidingPiece
  
  def move_dirs
    :straight
  end
end

class Queen < Piece
  include SlidingPiece
  
  def move_dirs
    :both
  end
end