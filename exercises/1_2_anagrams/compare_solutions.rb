#!/usr/bin/env -S ruby
# frozen_string_literal: true

require 'benchmark'

is_subfolder = (__dir__).include?('/exercises/')

if is_subfolder
  exercise_folder = __dir__.split('/exercises/').last
elsif ARGV.size > 0
  exercise_folder = ARGV[0]
else
  puts "\n" \
       "Error:\n" \
       "  Pass as an argument with the specific exercise subfolder\n" \
       "  Example\n" \
       "    compare_solutions.rb 1_1_number_format\n\n"
  exit(1)
end

exercise_path = "exercises/#{exercise_folder}/"
exercise_path_relative_prefix = is_subfolder ? './' : exercise_path
utils_path_relative_prefix = is_subfolder ? '../../' : './'

require_relative utils_path_relative_prefix + 'utils/quizzes_utils'

solution_names = QuizzesUtils.find_solutions(exercise_path)
if solution_names.empty?
  puts "\n" \
       "Error:\n" \
       "  No solutions found as:\n" \
       "    #{exercise_path}solution*.rb\n\n"
  exit(1)
end

require_relative exercise_path_relative_prefix + 'test_data'

solution_names.each do |solution_name|
  require_relative exercise_path_relative_prefix + solution_name
  eval "alias #{solution_name} #{SOLUTION_METHOD_NAME}"
end

test_data = TEST_DATA.keys

puts "\nBenchmarks for '#{exercise_folder}':\n\n"
Benchmark.bmbm do |x|
  solution_names.each do |solution_name|
    x.report(solution_name + ':') do
      test_data.each{|n| send(solution_name, n)}
    end
  end
end
puts
