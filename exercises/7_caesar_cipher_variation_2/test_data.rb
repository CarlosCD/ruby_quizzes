# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'decode'
plain_text = 'I should have known that you would have a perfect answer for me!!!'
encoded_1 = ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!']
TEST_DATA = {
              encoded_1      => plain_text,
              encoded_1.to_s => plain_text,
              ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'] => 'Now you know your ABCs!',
              ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'] =>
                'The same sentence, but split in 5 chunks',
              # Checking letters cycle (if shift is 1, Z => A, z => a):
              ['hnN', 'krr', 'u c', 'uxr', 'j!']      => 'Hello world!',
              ['hnN', 'krr', 'u c', 'uxr', 'j!'].to_s => 'Hello world!',
              ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'] =>
                'Z becomes A and z becomes a, right?',
              # Cases where the first character is not a letter:
              ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"] => '1 is a valid string',
              ["za1", "234", "567", "89A"] => '123456789Z'
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
