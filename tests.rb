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

methods = METHODS_MULTIPLE_ARITY.keys

METHODS_MULTIPLE_ARITY.each do |method_name, splat_arguments|
  code_lambda = ->(args) do
    if splat_arguments
      send method_name, *args
    else
      send method_name, args
    end
  end
  # method-specific details, if there is more than one method:
  details = QuizzesUtils.method_details(method_name)
  unless details
    puts 'Unable to read the test data'
    exit(1)
  end
  param_transformation, test_data, test_failure_extra_details = details
  test_data.each do |arg, result|
    arg = param_transformation.call(arg)
    QuizzesTests.test code_lambda, arg, result, error_extra: test_failure_extra_details
  end
end
