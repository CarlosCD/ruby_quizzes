# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'collinearity'
TEST_DATA = {
              # Faulty data returns false:
              nil             => false,
              'Hello world!'  => false,
              'puts "Hey!"'   => false,
              [1, 2, 3]       => false,
              [1, 2, 3, 4, 5] => false,
              # Vectors directed in one direction:
              [1, 1, 1, 1]   => true,
              '[1, 1, 1, 1]' => true,  # Takes Strings as well, representing an Array
              [1, 2, 2, 4]   => true,
              # Vectors directed in opposite directions:
              [1, 1, 6, 1]   => false,
              [1, 2, -1, -2] => true,
              [1, 2, 1, -2]  => false,
              # Vectors containing zero:
              [4, 0, 11, 0] => true,
              [0, 1, 6, 0]  => false,
              [4, 4, 0, 4] => false,
              # Vectors with coordinates x = 0 and y = 0"
              [0, 0, 0, 0] => true,
              [0, 0, 1, 0] => true,
              [5, 7, 0, 0] => true,
              [0, 0, 0, -989] => true,
              [0, -67, 0, -989] => true,
              [-947, 0, 473, 0] => true
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }