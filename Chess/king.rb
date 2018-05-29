require_relative "stepping_piece.rb"
require_relative "piece.rb"
class King < Piece
  include SteppingPiece
  def piece_type
    :king
  end

  def to_s
    #King gets $ because he's got that $$$$$$$
    return "$"
  end

end
