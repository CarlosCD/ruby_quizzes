# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'even_or_odd'
PARAM_TRANSFORMATION = ->(str) { str.to_i }  # Expects an Integer
TEST_DATA = {
              -2 => 'Even',
              -1 => 'Odd',
              0  => 'Even',
              1  => 'Odd',
              2  => 'Even',
              11 => 'Odd',
              42 => 'Even'
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
