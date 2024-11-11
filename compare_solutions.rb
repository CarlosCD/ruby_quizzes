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
    methods_details[m][:param_transformation], methods_details[m][:test_data] = details
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

# Example results, Ruby 3.3.5:
#
# Benchmarks for '7_caesar_cipher_variation':
#
# Rehearsal -------------------------------------------------------------------
# solution_encode_str:              0.000116   0.000005   0.000121 (  0.000121)
# solution_with_sleep_encode_str:   0.000431   0.000024   0.000455 (  0.001583)
# solution_decode:                  0.000090   0.000000   0.000090 (  0.000091)
# solution_with_sleep_decode:       0.000096   0.000013   0.000109 (  0.001234)
# ---------------------------------------------------------- total: 0.000775sec
#
#                                       user     system      total        real
# solution_encode_str:              0.000117   0.000000   0.000117 (  0.000117)
# solution_with_sleep_encode_str:   0.000118   0.000031   0.000149 (  0.001282)
# solution_decode:                  0.000075   0.000000   0.000075 (  0.000075)
# solution_with_sleep_decode:       0.000077   0.000023   0.000100 (  0.001228)
#
