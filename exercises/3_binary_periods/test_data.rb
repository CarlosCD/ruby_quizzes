# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'solution'
PARAM_TRANSFORMATION = ->(str) { str.to_i }  # Expects an Integer
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { " (#{arg.to_s(2)})" }
TEST_DATA = {
              1797753455250435 => -1, # 110011000110000110000011000000110000000110000000011
              11498610839207 => 9, # 101001110,101001110,101001110,101001110,10100111,10100111
              886702925625 => 5, # 11001,11001,11001,11001,11001,11001,11001,11001
              44916448590 => 9, # 101001110,101001110,101001110,101001110,10100111
              3469659854 => 8, # 11001110,11001110,11001110,11001110
              845625 => 5, # 11001,11001,11001,11001
              1651 => 5, # 11001,11001,11
              955 => 4,  # 1110,1110,11
              825 => 5,  # 11101,110
              255 => 1,  # 1,1,1,1,1,1,1,1
              123 => -1, # 1111011
              102 => -1, # 1100110
              15 => 1, # 1,1,1,1
              7 => 1 # 1,1,1
            }
