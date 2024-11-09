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
              # 7 chars, max. number of words in the file with this size (3,617 words):
              'abandon' => ['abandon'],
              'abdomen' => ['abdomen'],
              'zoology' => ['zoology'],
              'zooming' => ['zooming'],
              # 20 chars, min. number of words in the file with this size (2 words):
              'institutionalization' => ['institutionalization'],
              'internationalization' => ['internationalization'],
              # Only one spelling in the file:
              'zulu' => ['zulu'],
              'luuz' => ['zulu'],
              # Not in file (min. length of the words in file is 4 chars):
              'luz' => []
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
