#!/usr/bin/env -S ruby
# frozen_string_literal: true

word = ARGV[0]
solution_file = ARGV[1] if ARGV.size > 1

solution = solution_file || 'solution'

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as a second argument the Ruby file containing the solution:\n" \
       "  Example\n" \
       "    run_solution.rb horse solution_1\n\n"
  raise e
end

puts "'#{word}': #{anagram word}"
