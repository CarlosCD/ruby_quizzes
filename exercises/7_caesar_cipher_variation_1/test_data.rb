# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'encode_str'
plain_text = 'I should have known that you would have a perfect answer for me!!!'
encoded_1 = ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!']
TEST_DATA = {
              [plain_text, 1]        => encoded_1,
              "['#{plain_text}', 1]" => encoded_1,
              ['Now you know your ABCs!', 1] => ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'],
              ['The same sentence, but split in 5 chunks', 0] =>
                ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'],
              # Checking letters cycle (if shift is 1, Z => A, z => a):
              ['Hello world!', 6]      => ['hnN', 'krr', 'u c', 'uxr', 'j!'],
              ['Hello world!', 6].to_s => ['hnN', 'krr', 'u c', 'uxr', 'j!'],
              ['Z becomes A and z becomes a, right?', 1] =>
                ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'],
              # Cases where the first character is not a letter:
              ['1 is a valid string', 2] => ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"],
              ['123456789Z', 1] => ["za1", "234", "567", "89A"],
              # Not valid, I need at least one letter to encode the shift:
              ['12345--#', 2] => []
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
