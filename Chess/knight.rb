require_relative "stepping_piece.rb"
require_relative "piece.rb"
class Knight < Piece
  include SteppingPiece
  def piece_type
    :knight
  end

end
