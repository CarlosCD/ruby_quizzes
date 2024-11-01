# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'solution'
TEST_DATA = {
              '[1, 2, 3, 4, 5, 6, 7, 8]' => 0,
              '[1, 1, 1, 1]' => 4,
              '[22, 10, 21, 11, 2]' => 4,
              '[3, 2, 5, 4, 4, 6, 3, 2]' => 6,
              [1, 3, 2, 5, 4, 4, 6, 3, 2] => 7,
              '[1, 3, 2, 5, 4, 4, 6, 3, 2]' => 7,
              '[16, 17, 23, 24, 12, 4, 21, 1, 18]' => 7
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
