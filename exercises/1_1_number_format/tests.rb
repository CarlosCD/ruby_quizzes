#!/usr/bin/env -S ruby
# frozen_string_literal: true

require_relative 'solution'

def test(code_lambda, args, expected_result, error_message = nil)
  result = code_lambda.call(args)
  if result == expected_result
    puts 'passed'
  else
    print (error_message || 'failed')
    puts " - expected #{expected_result} but got #{result}"
  end
end

code_lambda = ->(num) { pretty_number(num) }
test code_lambda, 1, '1'
test code_lambda, 10, '10'
test code_lambda, 100, '100'
test code_lambda, 1000, '1,000'
test code_lambda, 10000, '10,000'
test code_lambda, 100000, '100,000'
test code_lambda, 1000000, '1,000,000'
test code_lambda, 35235235, '35,235,235'
test code_lambda, 1_000_000_000, '1,000,000,000'
