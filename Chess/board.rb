require_relative "piece.rb"
require 'byebug'
class Board
  
  def initialize 
    @grid = Array.new(8) { Array.new(8) } 
    @grid[0].each_index do |space_idx|
      # debugger
      rows = [0, 1] 
      rows.each do |row|
        piece = Piece.new(:black, self, [row, space_idx])
        @grid[row][space_idx] = piece  
      end 
      rows = [6, 7]
      rows.each do |row|
        piece = Piece.new(:white, self, [row, space_idx])
        @grid[row][space_idx] = piece  
      end 
      
      rows = [2,3,4,5]
      rows.each do |row|
        piece = nil
        @grid[row][space_idx] = piece  
      end 
    end 
    
  end 
  
  class NoPieceError < StandardError;end
  def move_piece(start_pos, end_pos)
    raise NoPieceError if self[start_pos].nil? 
    #add end_pos check 
    # debugger 
    self[end_pos] = self[start_pos]
    self[start_pos] = nil  
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    # debugger 
    @grid[pos[0]][pos[1]] = value 
  end 
  
end 