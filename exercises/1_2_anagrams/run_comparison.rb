#!/usr/bin/env -S ruby
# frozen_string_literal: true

# solution_3 seems to be considerably faster

# GC.disable

require 'benchmark'

require_relative 'solution_1'
alias anagram_1 anagram

require_relative 'solution_2'
alias anagram_2 anagram

require_relative 'solution_3'
alias anagram_3 anagram

puts "Benchmarks:\n\n"
words = %w(admits adolescence horse zulu)
Benchmark.bm do |x|
  x.report(:solution_1) do
    words.each do |w|
      anagram_1 w
    end
  end
  x.report(:solution_2) do
    words.each do |w|
      anagram_2 w
    end
  end
  x.report(:solution_3) do
    words.each do |w|
      anagram_3 w
    end
  end
end

# Results, Ruby 3.3.5:

#        user     system      total        real
# solution_1  0.115046   0.004862   0.119908 (  0.119926)
# solution_2  0.104385   0.003719   0.108104 (  0.108118)
# solution_3  0.022622   0.000730   0.023352 (  0.023355)

# Ruby 3.3.5 with the GC disabled:

#        user     system      total        real
# solution_1  0.070983   0.010303   0.081286 (  0.081303)
# solution_2  0.061930   0.018732   0.080662 (  0.080674)
# solution_3  0.017692   0.006107   0.023799 (  0.023800)
