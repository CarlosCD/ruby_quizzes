#!/usr/bin/env -S ruby
# frozen_string_literal: true

require 'benchmark'

NUM_SOLUTIONS = 4
solution_names = 1.upto(NUM_SOLUTIONS).collect{|num| "solution_#{num}"}

# Rename the solution method as solution_1, solution_2,...:
solution_names.each do |solution_name|
  require_relative solution_name
  eval "alias #{solution_name} solution"
end

numbers = [ 1797753455250435, 11498610839207, 886702925625, 44916448590, 3469659854, 845625, 1651, 955, 825, 255, 123, 102, 15, 7 ]

puts "Benchmarks:\n\n"
Benchmark.bmbm do |x|
  solution_names.each do |solution_name|
    x.report(solution_name + ':') do
      numbers.each{|n| send(solution_name, n)}
    end
  end
end

# Results, Ruby 3.3.5 (without the GC rehearsal):
#
#                   user     system      total        real
# solution_1:   0.000175   0.000004   0.000179 (  0.000178)
# solution_2:   0.000189   0.000001   0.000190 (  0.000189)
# solution_3:   0.000024   0.000000   0.000024 (  0.000025)
# solution_4:   0.000019   0.000000   0.000019 (  0.000019)
