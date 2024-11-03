# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'encode_str'
plain_text = 'I should have known that you would have a perfect answer for me!!!'
encoded_1 = ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!']
TEST_DATA = {
              [plain_text, 1]        => encoded_1,
              "['#{plain_text}', 1]" => encoded_1,
              ['Now you know your ABCs!', 1] => ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!']
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
