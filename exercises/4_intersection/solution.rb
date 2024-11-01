# frozen_string_literal: true

require 'matrix'

# Expects either an Array or a String representing an Array
def solution(a)
  ary = a
  # Allow String as an argument:
  ary = a.is_a?(String) ? (eval a) : a
  return 0 unless ary.is_a?(Array)
  # Removing invalid moves:
  ary = ary.delete_if{|v| v <= 0}
  return 0 if ary.size < 4
  # Initialize variables:
  position = Vector[0, 0] # LOGO Turtle position
  n = 0 # num moves done, also Array index for the next move
  # Segments the Turtle has already moved:
  horizontal_segments = {} # x => [(y1..y2),...]
  vertical_segments = {}   # y => [(x1..x2),...]
  #
  #        E
  #   X -------> X
  #   ^    2     |
  #   |         3| S
  #  N|1         |
  #   |       4  v
  #   X     <--- X
  #           W
  #
  #      North, East,   South,  West
  seq = [[0,1], [1, 0], [0,-1], [-1,0]].collect{|p| Vector.elements(p)}.
                                        cycle
  # Previous move always touches, we will not consider it:
  previous_range = {0 => (0..0)}  # Notice the value is a range, not an Array
  touched = false
  while !touched && n < ary.size do
    # This movement (Vector):
    move_by = (seq.next)*ary[n]
    # Next movement to (Vectors addition):
    new_position = position + move_by
    is_vertical = (move_by[0] == 0)
    if is_vertical
      movement_x = position[0]
      movement_segment = Range.new(*[position[1],new_position[1]].sort)
      # Touched if exists an horizontal_segment H[hy] == [(hx1..hx2),...] where
      #   * hy is included in movement_segment, and
      #   * it is not the previous horizontal movement (which always intersects), and
      #   * movement_x is included in (hx1..hx2)
      touched = horizontal_segments.any? do |hy,ranges|
        movement_segment.cover?(hy) &&
          ranges.any?{|r| (r != previous_range[hy]) && r.cover?(movement_x)}
      end
      vertical_segments[movement_x] ||= []
      vertical_segments[movement_x] << movement_segment
      previous_range = {movement_x => movement_segment}
    else
      movement_y = position[1]
      movement_segment = Range.new(*[position[0],new_position[0]].sort)
      # Touched if exists a vertical_segment V[hx] == [(vy1..vy2),...] where
      #   * hx is included in movement_segment, and
      #   * it is not the previous vertical movement (which always intersects), and
      #   * movement_y is included in (vy1..vy2)
      touched = vertical_segments.any? do |hx,ranges|
        movement_segment.cover?(hx) &&
          ranges.any?{|r| (r != previous_range[hx]) && r.cover?(movement_y)}
      end
      horizontal_segments[movement_y] ||= []
      horizontal_segments[movement_y] << movement_segment
      previous_range = {movement_y => movement_segment}
    end
    position = new_position
    n += 1
  end
  touched ? n : 0
end
