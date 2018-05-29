module SteppingPiece

  def moves
    case piece_type
    when :king
      delta_set = [[1,1], [1,0], [1,-1], [0,1], [0,-1], [-1,1], [-1,0], [-1,-1]]
      move_helper(delta_set) 
    when :knight
      delta_set = [[2,1],[2,-1],[-2,1],[-2,-1],
                   [1,2],[-1,2],[1,-2],[-1,-2]]
      move_helper(delta_set)
    end
  end

  def move_helper(delta_set)
    possible_moves = []
    y, x = self.pos
    delta_set.each do |diff|
      delta_y, delta_x = diff
      new_pos = [y + delta_y, x + delta_x]
      if self.board.valid_pos?(new_pos)
        if self.board[new_pos].nil? || self.color != self.board[new_pos].color
          possible_moves << new_pos
        end
      end
    end
    possible_moves
  end

end
