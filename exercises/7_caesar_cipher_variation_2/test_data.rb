# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'decode'
PARAM_TRANSFORMATION = ->(str) do
  # Expects an Array with 5 Strings
  return str unless str.is_a?(String)
  # Example: '["za", "12", "34", "5A"]'
  str.gsub(/\A\s*\[\s*[\"\'](.*)[\"\']\]\s*\z/, '\1'). # prefix & suffix #=> 'za", "12", "34", "5A'
      split(/[\'\"],\s*[\'\"]/)                        # splits by ", " #=> ['za', '12', '34', '5A']'
end
TEST_DATA = {
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
