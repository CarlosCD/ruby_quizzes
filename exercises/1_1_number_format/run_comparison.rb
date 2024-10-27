#!/usr/bin/env -S ruby
# frozen_string_literal: true

require 'benchmark'

exercise_path = __dir__ + '/'
solution_files = Dir["#{exercise_path}solution*.rb"]
if solution_files.empty?
  puts "\n" \
       "Error:\n" \
       "  No solutions find as:\n" \
       "    #{exercise_path}solution*.rb\n\n"
  exit(1)
end

require_relative exercise_path + 'test_data'

solution_names = solution_files.collect{|n| n[exercise_path.size..-4]}
solution_names.each do |solution_name|
  require_relative exercise_path + solution_name
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

# Results, Ruby 3.3.5 (without the GC rehearsal):
#
#                 user     system      total        real
# solution:   0.000024   0.000001   0.000025 (  0.000024)
