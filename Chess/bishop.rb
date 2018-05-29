require_relative "sliding_piece.rb"
require_relative "piece.rb"
class Bishop < Piece
  include SlidingPiece

  def move_dirs
    :diagonal
  end
end
