#!/usr/bin/env -S ruby
# frozen_string_literal: true

solution = ARGV[0] || 'solution'

require_relative 'test_data'

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as an argument the Ruby file containing the solution file:\n" \
       "  Example\n" \
       "    tests.rb solution_1\n\n"
  raise e
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
