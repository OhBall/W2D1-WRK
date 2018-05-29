require_relative 'piece.rb'
require_relative 'stepping_piece.rb'

class Pawn < Piece
  include SteppingPiece
  attr_reader :dir, :first_move
  attr_accessor :first_move

  def initialize(color, board, pos)
    super
    @first_move = true
    if pos[6] == 1
      @dir = :up
    else
      @dir = :down
    end
  end

  def piece_type
    :pawn
  end

  def to_s
    return "P"
  end
end
