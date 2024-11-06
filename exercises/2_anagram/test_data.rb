# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'anagram'
PARAM_TRANSFORMATION = ->(str) { str }  # Expects a String
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
TEST_DATA = {
              'admits' => %w(admits amidst),
              'adolescence' => ['adolescence'],
              'ample' => %w(ample maple),
              'anemic' => %w(anemic cinema),
              'battle' =>  %w(battle tablet),
              'dynamo' => %w(dynamo monday),
              'eric' => %w(eric rice),
              'horse' => %w(heros horse shore),
              'rescue' => %w(rescue secure),
              'zulu' => ['zulu'],
              'luuz' => ['zulu'],
              'luz' => []
            }
