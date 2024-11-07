#!/usr/bin/env -S ruby
# frozen_string_literal: true

arguments_missing = "Pass these arguments:\n" \
                    "  - The exercise subfolder\n" \
                    "  - The argument to pass to the solution method\n" \
                    "  - The method to use, if there is more than one\n" \
                    "  - The Ruby solution file\n"

if ARGV.size > 0
  exercise_folder = ARGV[0]
  argument = ARGV[1]  # String
  method_name = ARGV[2]
  solution = ARGV[3] || 'solution'
else
  puts "\nError:\n" +
       arguments_missing +
       "Example\n" \
       "  .\/run_solution.rb #{exercise_folder || '1_1_number_format'} 2000 pretty_number solution\n\n"
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

require_relative 'utils/quizzes_utils'

method_name = METHODS_MULTIPLE_ARITY.keys.first if METHODS_MULTIPLE_ARITY.keys.size == 1
if method_name.nil? || method_name.empty?
  puts "\nError: there are more than one possible methods to invoke\n" \
       "please include it as a last parameter\n" \
       "Examples:\n"
       METHODS_MULTIPLE_ARITY.keys.each do |m|
         puts "  .\/run_solution.rb #{exercise_folder || '1_1_number_format'} 'params' #{m} solution"
       end
  exit(1)
elsif !METHODS_MULTIPLE_ARITY.keys.include?(method_name.to_sym)
  puts "\nError:\n\n" \
       "The method '#{method_name}' is not present. Are you sure it is correct?"
  exit(1)
end

splat_arguments = METHODS_MULTIPLE_ARITY[method_name.to_sym]

# method-specific details, if there is more than one method:
details = QuizzesUtils.method_details(method_name)
unless details
  puts 'Unable to read the test data'
  exit(1)
end
param_transformation, test_data, test_failure_extra_details = details

if argument && param_transformation.is_a?(Proc)
  argument = param_transformation.call(argument)
end

unless argument
  puts "\n" \
       "Please pass at least one argument with the data to use " \
       "(and if there is more than one solution, the solution file).\n" +
       QuizzesUtils.examples_message_run(TEST_DATA.keys, exercise_folder:, splat_arguments:)
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
       QuizzesUtils.examples_message_run(test_data.keys, argument, exercise_folder:, splat_arguments:)
  exit(1)
end

result = if splat_arguments
           send method_name, *argument
         else
           send method_name, argument
         end
puts "For '#{argument}', the solution is '#{result}'"
