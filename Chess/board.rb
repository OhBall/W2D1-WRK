require_relative "pieces.rb"
require 'byebug'

class Board
  attr_reader :grid
  def initialize
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
        piece = nil
        @grid[row][space_idx] = piece
      end
    end

    #For testing purposes
    @grid[4][4] =  Queen.new(:light_blue,self, [4,4])

  end

  class NoPieceError < StandardError;end
  def move_piece(start_pos, end_pos)
    raise NoPieceError if self[start_pos].nil?
    #add end_pos check
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
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
p b[[4,4]].moves
