require 'colorize' 
require_relative 'cursor.rb'
require_relative 'board.rb' 

class Display
  attr_reader :cursor 
  
  def initialize(board)
    @board = board 
    @cursor = Cursor.new([0,0], board) 
  end 
  
  def render 
    @board.grid.each do |row| 
      row.each do |space| 
        # space = @board.grid[row][col]
        if space != nil  
          to_print = space.to_s.colorize(space.color)
        else
          to_print = ' '.colorize(:pink)
        end
        begin
          if space.pos == self.cursor.cursor_pos
            to_print = to_print.colorize(:background => :light_yellow)
          end 
        rescue NoMethodError => error 
          #Will change nil to pieces. 
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

