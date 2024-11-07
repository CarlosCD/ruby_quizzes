# frozen_string_literal: true

METHODS_MULTIPLE_ARITY = { anagram: false }
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

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
