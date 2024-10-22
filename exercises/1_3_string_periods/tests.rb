#!/usr/bin/env -S ruby
# frozen_string_literal: true

require_relative 'solution'

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
test code_lambda, 1651, 5 # 110011100111 => 11001,11001,11
test code_lambda, 955, 4  # 1110111011 => 1110,1110,11
test code_lambda, 255, 1  # 11111111 => 1,1,1,1,1,1,1,1
test code_lambda, 102, -1 # 1100110
test code_lambda, 15, 1   # 1111 => 1,1,1,1
test code_lambda, 7, 1    # 111 => 1,1,1
