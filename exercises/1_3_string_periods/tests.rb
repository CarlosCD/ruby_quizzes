#!/usr/bin/env -S ruby
# frozen_string_literal: true

solution = ARGV[0] || 'solution'

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as an argument the Ruby file containing the solution:\n" \
       "  Example\n" \
       "    tests.rb solution_1\n\n"
  raise e
end

def test(code_lambda, arg, expected_result, error_message = nil)
  result = code_lambda.call(arg)
  if result == expected_result
    puts 'passed'
  else
    print (error_message || 'failed')
    puts " - for #{arg} (#{arg.to_s(2)}), expected #{expected_result} but got #{result}"
  end
end

code_lambda = ->(number) { solution(number) }

test code_lambda, 1797753455250435, -1 # 110011000110000110000011000000110000000110000000011
test code_lambda, 11498610839207, 9 # 101001110,101001110,101001110,101001110,10100111,10100111
test code_lambda, 886702925625, 5 # 11001,11001,11001,11001,11001,11001,11001,11001
test code_lambda, 44916448590, 9 # 101001110,101001110,101001110,101001110,10100111
test code_lambda, 3469659854, 8 # 11001110,11001110,11001110,11001110
test code_lambda, 845625, 5 # 11001,11001,11001,11001
test code_lambda, 1651, 5 # 11001,11001,11
test code_lambda, 955, 4  # 1110,1110,11
test code_lambda, 825, 5  # 11101,110
test code_lambda, 255, 1  # 1,1,1,1,1,1,1,1
test code_lambda, 123, -1 # 1111011
test code_lambda, 102, -1 # 1100110
test code_lambda, 15, 1 # 1,1,1,1
test code_lambda, 7, 1 # 1,1,1
