#!/usr/bin/env -S ruby
# frozen_string_literal: true

arguments_missing = "Pass these arguments:\n" \
                    "  - The exercise subfolder\n" \
                    "  - The argument to pass to the solution method\n" \
                    "  - The Ruby solution file\n"

if ARGV.size > 0
  exercise_folder = ARGV[0]
  argument = ARGV[1]  # String
  solution = ARGV[2] || 'solution'
else
  puts "\nError:\n" +
       arguments_missing +
       "Example\n" \
       "  .\/run_solution.rb #{exercise_folder || '1_1_number_format'} 2000 solution\n\n"
  exit(1)
end

exercise_path = "exercises/#{exercise_folder}/"

begin
  require_relative "#{exercise_path}test_data"
rescue Exception => e
  puts "\nError: #{e}\n\n"
  puts "Unable to find '#{exercise_path}test_data.rb'"
  puts "Are you sure that the exercise folder '#{exercise_folder}' is correct?"
  exit(1)
end

if argument && PARAM_TRANSFORMATION.is_a?(Proc)
  argument = PARAM_TRANSFORMATION.call(argument)
end

require_relative 'utils/quizzes_utils'

unless argument
  puts "\n" \
       "Please pass at least one argument with the data to use " \
       "(and if there is more than one solution, the solution file).\n" +
       QuizzesUtils.examples_message_run(TEST_DATA.keys, exercise_folder:,
                                         splat_arguments: SOLUTION_METHOD_MULTIPLE_ARITY)
  exit(1)
end

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

begin
  require_relative "#{exercise_path}#{solution}"
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n\n" +
       arguments_missing +
       QuizzesUtils.examples_message_run(TEST_DATA.keys, argument, exercise_folder:,
                                         splat_arguments: SOLUTION_METHOD_MULTIPLE_ARITY)
  exit(1)
end

result = if SOLUTION_METHOD_MULTIPLE_ARITY
           send SOLUTION_METHOD_NAME, *argument
         else
           send SOLUTION_METHOD_NAME, argument
         end
puts "For '#{argument}', the solution is '#{result}'"
