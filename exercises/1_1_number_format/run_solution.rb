#!/usr/bin/env -S ruby
# frozen_string_literal: true

require_relative 'solution'

number = ARGV.first.to_i
if ARGV.first != number.to_s
  puts "\n" \
       "Please include a number as a single argument\n" \
       "Example:\n" \
       "  ./run_solution.rb 42\n" \
       "\n"
  exit(1)
end

puts "#{number} ---> #{pretty_number(number)}"
