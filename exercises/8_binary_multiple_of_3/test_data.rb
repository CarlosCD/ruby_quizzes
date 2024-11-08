# frozen_string_literal: true

METHODS_MULTIPLE_ARITY = { multipleOf3Regex: false }
TEST_DATA = {
              ' 0' => false,
              'abc' => false,
              '011 110' => false,
              '000' => true,
              '001' => false,
              '011' => true,
              '110' => true,
              '111' => false,
              '1001' => true,
              (12345678).to_s(2) => true
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
