#!/usr/bin/env -S ruby
# frozen_string_literal: true

is_subfolder = (__dir__).include?('/exercises/')
# If is subfolder, use the exercise's folder instead of the first argument:
exercise_folder = __dir__.split('/exercises/').last if is_subfolder

arguments_missing = "Pass these arguments:\n" \
                    "  - The exercise subfolder\n" \
                    "  - The argument to pass to the solution method\n" \
                    "  - The Ruby solution file\n"

if ARGV.size > 0
  exercise_folder ||= ARGV[0]
  argument = ARGV[1]
  solution = ARGV[2] || 'solution'
else
  puts "\nError:\n" +
       arguments_missing +
       "Example\n" \
       "  run_solution.rb #{exercise_folder || '1_1_number_format'} 2000 solution\n\n"
  exit(1)
end

exercise_path = "exercises/#{exercise_folder}/"
exercise_path_relative_prefix = is_subfolder ? './' : exercise_path
utils_path_relative_prefix = is_subfolder ? '../../' : './'

require_relative exercise_path_relative_prefix + 'test_data'
require_relative utils_path_relative_prefix + 'utils/quizzes_utils'

unless argument
  puts "\n" \
       "Please pass at least one argument with the data to use " \
       "(and if there is more than one solution, the solution file).\n" +
       QuizzesUtils.examples_message_run(TEST_DATA.keys, exercise_folder:)
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
  require_relative exercise_path_relative_prefix + solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n\n" +
       arguments_missing +
       QuizzesUtils.examples_message_run(TEST_DATA.keys, argument, exercise_folder:)
  exit(1)
end

puts "For '#{argument}', the solution is '#{send SOLUTION_METHOD_NAME, argument}'"
