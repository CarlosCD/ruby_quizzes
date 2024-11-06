#!/usr/bin/env -S ruby
# frozen_string_literal: true

exercise_folder = ARGV[0]
solution = ARGV[1] || 'solution'

if exercise_folder.nil?
  puts "\n" \
       "Error:\n" \
       "  Pass as an argument with the specific exercise subfolder\n" \
       "  Example\n" \
       "    .\/tests.rb 1_1_number_format\n\n"
  exit(1)
end

exercise_path = "exercises/#{exercise_folder}/"
solution_file = "#{exercise_path}#{solution}.rb"
unless File.exist?(solution_file)
  puts "\n" \
       "Error:\n" \
       "  No solutions found as '#{solution_file}'\n\n"
  possibles = Dir["#{exercise_path}solution*.rb"].collect{|fn| File.basename(fn, '.rb')}
  unless possibles.empty?
    puts 'Could it be one of these?'
    possibles.each do |fn|
      puts "- #{fn}"
    end
  end
  exit(1)
end

require_relative "#{exercise_path}test_data"
require_relative 'utils/quizzes_utils'
require_relative 'utils/quizzes_tests'

begin
  require_relative "#{exercise_path}#{solution}"
rescue Exception => e
  puts "\nError: #{e}\n\n"
  puts 'Pass a parameter with the Ruby solution file.'
  puts 'Examples:'
  puts QuizzesUtils.examples_message_test
  exit(1)
end

code_lambda = ->(arg) { send SOLUTION_METHOD_NAME, arg }
TEST_DATA.each do |arg, result|
  arg = PARAM_TRANSFORMATION.call(arg)
  QuizzesTests.test code_lambda, arg, result, error_extra: TEST_FAILURE_EXTRA_DETAILS
end
