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
#                   user     system      total        real
# solution_1:   0.157341   0.003710   0.161051 (  0.161087)
# solution_2:   0.155183   0.003695   0.158878 (  0.158943)
# solution_3:   0.026508   0.000817   0.027325 (  0.027340)

# solution_3 seems to be considerably faster
