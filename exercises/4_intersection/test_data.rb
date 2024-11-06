# frozen_string_literal: true

PARAM_TRANSFORMATION = ->(str) do
  # Expects an Array of numbers
  str.is_a?(String) ? str.gsub(/[\s\[\]]+/, '').split(',').collect(&:to_i) : str
end
TEST_DATA = {
              [1, 2, 3, 4, 5, 6, 7, 8] => 0,
              [1, 1, 1, 1] => 4,
              [22, 10, 21, 11, 2] => 4,
              [3, 2, 5, 4, 4, 6, 3, 2] => 6,
              [1, 3, 2, 5, 4, 4, 6, 3, 2] => 7,
              [16, 17, 23, 24, 12, 4, 21, 1, 18] => 7
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
