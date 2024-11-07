# frozen_string_literal: true

# Expects 4 numeric values
def collinearity(x1, x2, y1, y2)
  if x1 == 0 || x2 == 0 || y1 == 0 || y2 == 0
    return  (x1 == 0 && y1 == 0) || (x2 == 0 && y2 == 0) || # Origin is collinear
            (x1 == 0 && x2 == 0) || (y1 == 0 && y2 == 0)    # x's or y's are both zero (any factor)
  end
  # No zeros:
  factor = x1.to_f / x2.to_f
  x2*factor == x1.to_f && y2*factor == y1.to_f
end
