#!/usr/bin/env -S ruby
# frozen_string_literal: true

number = ARGV[0]
solution_file = ARGV[1] if ARGV.size > 1

solution = solution_file || 'solution'

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as a second argument the Ruby file containing the solution:\n" \
       "  Example\n" \
       "    run_solution.rb 42 solution_1\n\n"
  raise e
end

if number != number.to_i.to_s
  puts "\n" \
       "Please include an Integer number as the first argument\n" \
       "Example:\n" \
       "  ./run_solution.rb 42 solution_1\n" \
       "\n"
  exit(1)
else
  number = number.to_i
end

puts "#{number} binary period: #{solution(number)}"
