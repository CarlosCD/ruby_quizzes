#!/usr/bin/env -S ruby
# frozen_string_literal: true

solution = ARGV[0] || 'solution'

require_relative 'test_data'
require_relative '../../utils/quizzes_utils'
require_relative '../../utils/quizzes_tests'

begin
  require_relative solution
rescue Exception => e
  puts "\nError: #{e}\n\n"
  puts "Pass a parameter with the Ruby solution file."
  puts "Examples:"
  puts QuizzesUtils.examples_message_test
  exit(1)
end

code_lambda = ->(arg) { send SOLUTION_METHOD_NAME, arg }
TEST_DATA.each do |arg, result|
  QuizzesTests.test code_lambda, arg, result, error_extra: TEST_FAILURE_EXTRA_DETAILS
end
