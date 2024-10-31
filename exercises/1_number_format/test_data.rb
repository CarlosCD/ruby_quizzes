# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'pretty_number'
TEST_DATA = {
              1 => '1',
              10 => '10',
              100 => '100',
              1000 => '1,000',
              10000 => '10,000',
              100000 => '100,000',
              1000000 => '1,000,000',
              35235235 => '35,235,235',
              1_000_000_000 => '1,000,000,000'
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
