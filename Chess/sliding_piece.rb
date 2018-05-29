module SlidingPiece

  def moves
    possible_moves = []
    case move_dirs
    when :diagonal

    when :straight
      y, x = self.pos
      operations_set = [[:-,:return_self],[:+,:return_self],[:return_self,:-],[:return_self,:+]]
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
    when :both

    end
  end

end
