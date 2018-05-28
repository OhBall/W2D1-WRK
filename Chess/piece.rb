class Piece 
  attr_reader :color, :pos 
  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos 
  end 
  
  def to_s
    return "P"
  end
  
end 