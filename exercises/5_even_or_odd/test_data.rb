# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'even_or_odd'
TEST_DATA = {
              -2   => 'Even',
              -1   => 'Odd',
              0    => 'Even',
              1    => 'Odd',
              2    => 'Even',
              '11' => 'Odd',
              42   => 'Even',
              '42' => 'Even'
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
