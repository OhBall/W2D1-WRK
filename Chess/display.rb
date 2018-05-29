require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    self.board.grid.each_with_index do |row, r_idx|
      row.each_with_index do |space, s_idx|
        # space = @board.grid[row][col]
        to_print = space.to_s.colorize(space.color)
        if [r_idx, s_idx] == self.cursor.cursor_pos
          to_print = to_print.colorize(:background => :light_yellow)
        end
        print to_print
      end
      print "\n"
    end
  end

  def play
    i = 0
    while i < 20
      system "clear"
      render
      p @cursor.cursor_pos
      @cursor.get_input
      i += 1
    end

  end

end

b = Board.new
dis = Display.new(b)
dis.play
