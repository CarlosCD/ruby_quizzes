# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'anagram'
TEST_DATA = {
              'admits' => %w(admits amidst),
              'adolescence' => ['adolescence'],
              'horse' => %w(heros horse shore),
              'zulu' => ['zulu'],
              'luuz' => ['zulu'],
              'luz' => []
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
