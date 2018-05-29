require_relative "pieces.rb"
require 'byebug'

class Board
  attr_reader :grid, :null
  def initialize
    @null = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) }
    @grid[0].each_index do |space_idx|
      rows = [0, 1]
      rows.each do |row|
        piece = Piece.new(:black, self, [row, space_idx])
        @grid[row][space_idx] = piece
      end
      rows = [6, 7]
      rows.each do |row|
        piece = Piece.new(:light_blue, self, [row, space_idx])
        @grid[row][space_idx] = piece
      end

      rows = [2,3,4,5]
      rows.each do |row|
        piece = self.null
        @grid[row][space_idx] = piece
      end
    end

    #For testing purposes
    @grid[0][3] =  Pawn.new(:black,self, [0,3])

  end

  class NoPieceError < StandardError;end
  def move_piece(start_pos, end_pos)
    raise NoPieceError if self[start_pos] == self.null
    #add end_pos check
    self[end_pos] = self[start_pos]
    self[start_pos] = self.null
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def valid_pos?(pos)
    pos.each do |ord|
      return false if ord > 7 || ord < 0
    end
    true
  end

end
b = Board.new
p b[[0,3]].moves
# b[[2,3]].first_move = false
# p b[[2,3]].moves
