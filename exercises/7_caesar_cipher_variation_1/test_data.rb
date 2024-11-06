# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'encode_str'
PARAM_TRANSFORMATION = ->(str) do
  # Expects an Array with 2 elements: a String and an Integer
  s = str.is_a?(String) ? str.gsub(/[\s\[\]]+/, '').split(',').compact[0,2] : str
  [s.first, s.last.to_i]
end
TEST_DATA = {
              ['I should have known that you would have a perfect answer for me!!!', 1] =>
                ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!'],
              ['Now you know your ABCs!', 1] => ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'],
              ['The same sentence, but split in 5 chunks', 0] =>
                ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'],
              # Checking letters cycle (if shift is 1, Z => A, z => a):
              ['Z becomes A and z becomes a, right?', 1] =>
                ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'],
              ['Hello world!', 6] => ['hnN', 'krr', 'u c', 'uxr', 'j!'],
              # Cases where the first character is not a letter:
              ['1 is a valid string', 2] => ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"],
              ['123456789Z', 1] => ["za1", "234", "567", "89A"],
              # Not valid, I need at least one letter to encode the shift:
              ['12345--#', 2] => []
            }

# At the end, define the defaults:
require_relative '../../utils/test_data_defaults'
