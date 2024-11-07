# frozen_string_literal: true

METHODS_MULTIPLE_ARITY = { encode_str: true, decode: false }
PARAM_TRANSFORMATION_ENCODE_STR = ->(str) do
  return str unless str.is_a?(String)
  # Expects 2 arguments: a String and an Integer
  #   Formats supported in the command line argument:
  #   'lalalala, 2',    OR "lalalala, 2"
  #   '"lalalala", 2'   OR "'lalalala', 2"
  #   '[lalalala, 2]'   OR "[lalalala, 2]"
  #   '["lalalala", 2]' OR "['lalalala', 2]"
  #   
  r1 = /\A\s*\[?(.*),\s*(\d+)\]?\z/
  s, n = str.gsub(r1, '\\1,\\2').split(',')
  # Optional String quotations:
  r2 = /\A["']?(.*)["']\z/
  s = s.gsub(r2, '\\1')
  [ s, n.to_i ]
end
PARAM_TRANSFORMATION_DECODE = ->(str) do
  # Expects an Array with 5 Strings
  return str unless str.is_a?(String)
  # Example: '["za", "12", "34", "5A"]'
  str.gsub(/\A\s*\[\s*[\"\'](.*)[\"\']\]\s*\z/, '\1'). # prefix & suffix #=> 'za", "12", "34", "5A'
      split(/[\'\"],\s*[\'\"]/)                        # splits by ", " #=> ['za', '12', '34', '5A']'
end
TEST_DATA_ENCODE_STR = {
              ['I should have known that you would have a perfect answer for me!!!', 1] =>
                ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!'],
              ['Now you know your ABCs!', 1] => ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'],
              ['The same sentence, but split in 5 chunks', 0] =>
                ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'],
              # Less than 5 chunks (small String):
              ['A', 2] => ['a','c','C'],
              # Checking letters cycle (if shift is 1, Z => A, z => a):
              ['Z becomes A and z becomes a, right?', 1] =>
                ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'],
              ['Hello world!', 6] => ['hnN', 'krr', 'u c', 'uxr', 'j!'],
              ['Z', 1] => ['z','a','A'],
              # Cases where the first character is not a letter:
              ['1 is a valid string', 2] => ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"],
              ['123456789Z', 1] => ["za1", "234", "567", "89A"],
              # Not valid, I need at least one letter to encode the shift:
              ['12345--#', 2] => []
            }
TEST_DATA_DECODE = {
                      ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!'] =>
                        'I should have known that you would have a perfect answer for me!!!',
                      ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'] => 'Now you know your ABCs!',
                      ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'] =>
                        'The same sentence, but split in 5 chunks',
                      # Less than 5 chunks (small String):
                      ['a','c','C'] => 'A',
                      # Checking letters cycle (if shift is 1, Z => A, z => a):
                      ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'] =>
                        'Z becomes A and z becomes a, right?',
                      ['hnN', 'krr', 'u c', 'uxr', 'j!'] => 'Hello world!',
                      ['z','a','A'] => 'Z',
                      # Cases where the first character is not a letter:
                      ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"] => '1 is a valid string',
                      ["za1", "234", "567", "89A"] => '123456789Z'
                  }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
