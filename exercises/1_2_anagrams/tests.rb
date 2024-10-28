#!/usr/bin/env -S ruby
# frozen_string_literal: true

solution = ARGV[0] || 'solution'

require_relative 'test_data'
require_relative '../../utils/quizzes_utils'

begin
  require_relative solution
rescue Exception => e
  puts "\nError: #{e}\n\n"
  puts "Pass a parameter with the Ruby solution file."
  puts "Examples:"
  puts QuizzesUtils.examples_message_test
  exit(1)
end

def test(code_lambda, args, expected_result, error_message = nil)
  result = code_lambda.call(args)
  if result == expected_result
    puts 'passed'
  else
    print (error_message || 'failed')
    puts " - for '#{args}'#{TEST_FAILURE_EXTRA_DETAILS.call(args)}, " \
         "expected '#{expected_result}' but got '#{result}'"
  end
end

code_lambda = ->(arg) { send SOLUTION_METHOD_NAME, arg }
TEST_DATA.each do |arg, result|
  test code_lambda, arg, result
end
