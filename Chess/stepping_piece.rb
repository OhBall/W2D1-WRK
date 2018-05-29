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
    when :pawn
      dir_hash = {up: -1, down: 1}
      op = dir_hash[dir]
      delta_set = []
      # debugger
      in_front = [(self.pos[0] + dir_hash[self.dir]), self.pos[1]]
      if self.board.valid_pos?(in_front) && self.board[in_front] == self.board.null
        delta_set << [1,0]
        delta_set << [2,0] if self.first_move
      end

      delta_set.map! {|set| [(op * set[0]), set[1]] }
      # debugger
      diags = [[1,1],[1,-1]]
      diags.map! {|set| [(op * set[0]), set[1]] }
      diags.each do |diff|
        y, x = self.pos
        delta_y, delta_x = diff
        new_pos = [y + delta_y, x + delta_x]
        # debugger
        delta_set << diff if self.board.valid_pos?(new_pos) &&
          self.board[new_pos] != self.board.null
      end
      move_helper(delta_set)
    end

  end

  def move_helper(delta_set)
    # debugger
    possible_moves = []
    y, x = self.pos
    delta_set.each do |diff|
      delta_y, delta_x = diff
      new_pos = [y + delta_y, x + delta_x]
      if self.board.valid_pos?(new_pos) && self.color != self.board[new_pos].color
          possible_moves << new_pos
      end
    end
    possible_moves
  end

end
