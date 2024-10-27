#!/usr/bin/env -S ruby
# frozen_string_literal: true

require_relative 'test_data'

if ARGV.size > 0
  argument = ARGV[0]
  solution = ARGV[1] || 'solution'
else
  puts "\n" \
       "Please pass at least one argument with the data to use (and if there is more than one solution, the solution file),\n" \
       "Examples:\n" \
       "  run_solution.rb #{TEST_DATA.keys.sample}\n" \
       "  run_solution.rb #{TEST_DATA.keys.sample} solution\n" \
       "  run_solution.rb #{TEST_DATA.keys.sample} solution_1\n\n"
  exit(1)
end

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as a second argument the Ruby file containing the solution:\n" \
       "  Example\n" \
       "    run_solution.rb #{argument || TEST_DATA.keys.sample} solution_1\n\n"
  exit(1)
end

puts "For '#{argument}', the solution is '#{send SOLUTION_METHOD_NAME, argument}'"
