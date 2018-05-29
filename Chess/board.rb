require_relative "pieces.rb"
require 'byebug'

class Board
  attr_reader :grid, :null
  def initialize
    @null = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) }
    @grid[0].each_index do |space_idx|

      piece = Pawn.new(:black, self, [1, space_idx])
      @grid[1][space_idx] = piece

      piece = Pawn.new(:light_blue, self, [6, space_idx])
      @grid[6][space_idx] = piece

      rows = [2,3,4,5]
      rows.each do |row|
        piece = self.null
        @grid[row][space_idx] = piece
      end
    end
    @grid[0] = back_row_builder(:black, 0)
    @grid[7] = back_row_builder(:light_blue, 7)

    #For testing purposes
    @grid[0][3] =  Pawn.new(:black,self, [0,3])

  end

  def back_row_builder(color, row)
    back_row = []
    back_row << Rook.new(color, self, [row, 0])
    back_row << Knight.new(color, self, [row, 1])
    back_row << Bishop.new(color, self, [row, 2])
    back_row << King.new(color, self, [row, 3])
    back_row << Queen.new(color, self, [row, 4])
    back_row << Rook.new(color, self, [row, 5])
    back_row << Knight.new(color, self, [row, 6])
    back_row << Bishop.new(color, self, [row, 7])
    back_row
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

  def in_check?(color)
    @grid.each do |row|
      row.each do |col|
        king_pos = col.pos if col.class == King && col.color == color
      end
    end



    @grid.each do |row|
      row.each do |col|
        return true if col != self.null &&
          col.color != color &&
          col.moves.include?(king_pos)
      end
    end
    false
  end
end
b = Board.new
p b[[0,3]].moves
# b[[2,3]].first_move = false
# p b[[2,3]].moves
