require_relative "sliding_piece.rb"
require_relative "piece.rb"
class Queen < Piece
  include SlidingPiece

  def move_dirs
    :both
  end

  def to_s
    return "Q"
  end
end
