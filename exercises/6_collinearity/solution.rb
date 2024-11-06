# frozen_string_literal: true

# Expects an Array of 4 numbers
def collinearity(ary)
  return false if !ary.is_a?(Array) || ary.compact.size != 4
  # Initialize:
  x1, x2, y1, y2 = ary
  if x1 == 0 || x2 == 0 || y1 == 0 || y2 == 0
    return  (x1 == 0 && y1 == 0) || (x2 == 0 && y2 == 0) || # Origin is collinear
            (x1 == 0 && x2 == 0) || (y1 == 0 && y2 == 0)    # x's or y's are both zero (any factor)
  end
  # No zeros:
  factor = x1.to_f / x2.to_f
  x2*factor == x1.to_f && y2*factor == y1.to_f
end
