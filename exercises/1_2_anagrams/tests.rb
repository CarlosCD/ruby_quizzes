#!/usr/bin/env -S ruby
# frozen_string_literal: true

solution = ARGV[0] || 'solution'

begin
  require_relative solution
rescue Exception => e
  puts "\n" \
       "Error: #{e}\n" \
       "  Pass as an argument the Ruby file containing the solution:\n" \
       "  Example\n" \
       "    tests.rb solution_1\n\n"
  raise e
end

def test(code_lambda, args, expected_result, error_message = nil)
  result = code_lambda.call(args)
  if result == expected_result
    puts 'passed'
  else
    print (error_message || 'failed')
    puts " - expected #{expected_result} but got #{result}"
  end
end

code_lambda = ->(word) { anagram(word) }
test code_lambda, 'admits', %w(admits amidst)
test code_lambda, 'adolescence', ['adolescence']
test code_lambda, 'horse', %w(heros horse shore)
test code_lambda, 'zulu', ['zulu']
test code_lambda, 'luuz', ['zulu']
test code_lambda, 'luz', []
