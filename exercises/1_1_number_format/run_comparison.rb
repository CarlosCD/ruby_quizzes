#!/usr/bin/env -S ruby
# frozen_string_literal: true

require 'benchmark'

# The exercise folder: 1_1_number_format, 1_2_anagrams, or 1_3_string_periods
exercise_folder = (__dir__).split('exercises/').last

exercise_path = "exercises/#{exercise_folder}/"
exercise_path_relative_prefix = './'
utils_path_relative_prefix = '../../'

require_relative utils_path_relative_prefix + 'utils/quizzes_utils'

solution_names = QuizzesUtils.find_solutions(exercise_path)
if solution_names.empty?
  puts "\n" \
       "Error:\n" \
       "  No solutions find as:\n" \
       "    #{exercise_path}solution*.rb\n\n"
  exit(1)
end

require_relative exercise_path_relative_prefix + 'test_data'

solution_names.each do |solution_name|
  require_relative exercise_path_relative_prefix + solution_name
  eval "alias #{solution_name} #{SOLUTION_METHOD_NAME}"
end

test_data = TEST_DATA.keys

puts "Benchmarks:\n\n"
Benchmark.bmbm do |x|
  solution_names.each do |solution_name|
    x.report(solution_name + ':') do
      test_data.each{|n| send(solution_name, n)}
    end
  end
end
