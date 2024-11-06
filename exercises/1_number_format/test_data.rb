# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'pretty_number'
PARAM_TRANSFORMATION = ->(str) do
  # Expects a positive Integer lower than 1_000_000_000
  number = str.to_i
  number = 0 if number < 0
  number = 1_000_000_000 if number >= 1_000_000_000
  number
end
TEST_DATA = {
              0 => '0',
              1 => '1',
              10 => '10',
              999 => '999',
              1000 => '1,000',
              10000 => '10,000',
              100000 => '100,000',
              1000000 => '1,000,000',
              35235235 => '35,235,235',
              1_000_000_000 => '1,000,000,000'
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
