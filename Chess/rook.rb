require_relative "sliding_piece.rb"
require_relative "piece.rb" 
class Rook < Piece
  include SlidingPiece

  def move_dirs
    :straight
  end
end
