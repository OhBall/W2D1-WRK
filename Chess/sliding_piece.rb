module SlidingPiece

  def moves
    case move_dirs
    when :diagonal
      operations_set = [[:+, :+], [:+, :-], [:-, :+], [:-, :-]]
      move_helper(self.pos, operations_set)
    when :straight
      operations_set = [[:-,:return_self],[:+,:return_self],
                        [:return_self,:-],[:return_self,:+]]
      move_helper(self.pos, operations_set)
    when :both
      operations_set = [[:+, :+], [:+, :-], [:-, :+], [:-, :-],
        [:-,:return_self],[:+,:return_self],[:return_self,:-],[:return_self,:+]]
      move_helper(self.pos, operations_set)
    end
  end


  def move_helper(start_pos, operations_set)
    y, x = start_pos
    possible_moves = []
    operations_set.each do |operations|
      op1, op2 = operations
      diff = 1
      new_pos = [y.send(op1,diff), x.send(op2,diff)]
      while self.board[new_pos] == nil
        break unless self.board.valid_pos?(new_pos)
        possible_moves << new_pos
        diff += 1
        new_pos = [y.send(op1,diff), x.send(op2,diff)]
      end

      unless self.board[new_pos].nil? || self.board[new_pos].color == self.color
        possible_moves << new_pos
      end

    end
    possible_moves
  end

end
