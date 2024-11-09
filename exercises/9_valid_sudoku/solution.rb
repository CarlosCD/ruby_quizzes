# frozen_string_literal: true

# Expects an Array of Arrays
def solution(grid)
  n = grid.size - 1  # 8 for a grid 9x9
  memo = Set.new
  0.upto(n) do |row|
    0.upto(n) do |col|
      if grid[row][col] != '.'
        # Set#add?(obj)
        #   if obj was in the Set, returns nil  #=> returns false
        #   otherwise, adds it, and returns obj #=> continues
        return false unless memo.add?("#{grid[row][col]} row #{row}") &&
                            memo.add?("#{grid[row][col]} col #{col}") &&
                            memo.add?("#{grid[row][col]} square #{row/3} #{col/3}")
      end
    end
  end
  true
end
