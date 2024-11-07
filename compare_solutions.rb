#!/usr/bin/env -S ruby
# frozen_string_literal: true

require 'benchmark'
require_relative 'utils/quizzes_utils'

if ARGV.size > 0
  exercise_folder = ARGV[0]
else
  puts "\n" \
       "Error:\n" \
       "  Pass as an argument with the specific exercise subfolder\n" \
       "  Example\n" \
       "    .\/compare_solutions.rb 1_1_number_format\n\n"
  exit(1)
end

exercise_path = "exercises/#{exercise_folder}/"

solution_names = QuizzesUtils.find_solutions(exercise_path)
if solution_names.empty?
  puts "\n" \
       "Error:\n" \
       "  No solutions found as:\n" \
       "    #{exercise_path}solution*.rb\n\n"
  exit(1)
end

require_relative "#{exercise_path}test_data"

methods_details = {}
METHODS_MULTIPLE_ARITY.each do |m, s|
  details = QuizzesUtils.method_details(m)
  unless details.nil?
    methods_details[m] = { splat_arguments: s }
    methods_details[m][:param_transformation], methods_details[m][:test_data], methods_details[m][:test_failure_extra_details] = details
    methods_details[m][:test_data] = methods_details[m][:test_data].keys
  end
end

solution_names.each do |solution_name|
  require_relative "#{exercise_path}#{solution_name}"
  methods_details.keys.each do |m|
    eval "alias #{solution_name}_#{m} #{m}"
  end
end

puts "\nBenchmarks for '#{exercise_folder}':\n\n"
Benchmark.bmbm do |x|
  methods_details.keys.each do |m|
    transformer = methods_details[m][:param_transformation]
    transform_it = transformer.is_a?(Proc)
    splat_it = methods_details[m][:splat_arguments]
    test_data = methods_details[m][:test_data]
    solution_names.each do |solution_name|
      method_name = "#{solution_name}_#{m}"
      x.report("#{method_name}:") do
        test_data.each do |n|
          args = transform_it ? transformer.call(n) : n
          if splat_it
            send method_name, *args
          else
            send method_name, args
          end
        end
      end
    end
  end
end
puts

# Example results, Ruby 3.3.5 (without the GC rehearsal):
#
# 1_1_number_format:
#
#                 user     system      total        real
# solution:   0.000024   0.000001   0.000025 (  0.000024)
#
#
# 1_2_anagrams:
#
#                   user     system      total        real
# solution_1:   0.157341   0.003710   0.161051 (  0.161087)
# solution_2:   0.155183   0.003695   0.158878 (  0.158943)
# solution_3:   0.026508   0.000817   0.027325 (  0.027340)
#
#
# 1_3_string_periods:
#
#                   user     system      total        real
# solution_1:   0.000175   0.000004   0.000179 (  0.000178)
# solution_2:   0.000189   0.000001   0.000190 (  0.000189)
# solution_3:   0.000024   0.000000   0.000024 (  0.000025)
# solution_4:   0.000019   0.000000   0.000019 (  0.000019)
#
