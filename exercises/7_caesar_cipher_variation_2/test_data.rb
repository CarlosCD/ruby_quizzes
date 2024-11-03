# frozen_string_literal: true

SOLUTION_METHOD_NAME = 'decode'
plain_text = 'I should have known that you would have a perfect answer for me!!!'
encoded_1 = ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!']
TEST_DATA = {
              encoded_1      => plain_text,
              encoded_1.to_s => plain_text,
              ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'] => 'Now you know your ABCs!'
            }
TEST_FAILURE_EXTRA_DETAILS = ->(arg) { '' }
