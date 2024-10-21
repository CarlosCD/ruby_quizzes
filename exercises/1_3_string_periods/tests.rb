#!/usr/bin/env -S ruby
# frozen_string_literal: true

require_relative 'solution'

def test(code_lambda, args, expected_result, error_message = nil)
  result = code_lambda.call(args)
  if result == expected_result
    puts 'passed'
  else
    print (error_message || 'failed')
    puts " - for #{args}, expected #{expected_result} but got #{result}"
  end
end

code_lambda = ->(number) { solution(number) }
test code_lambda, 955, 4  # 1110111011 => 1110,1110,11
test code_lambda, 102, -1 # 1100110
