#!/usr/bin/env -S ruby
# frozen_string_literal: true

# GC.disable

require 'benchmark'

require_relative 'solution_1'
alias anagram_1 anagram

require_relative 'solution_2'
alias anagram_2 anagram

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
end

# Results (Ruby 3.3.5):

#        user     system      total        real
# solution_1  0.115046   0.004862   0.119908 (  0.119926)
# solution_2  0.104385   0.003719   0.108104 (  0.108118)

# With the GC disabled:

#        user     system      total        real
# solution_1  0.070983   0.010303   0.081286 (  0.081303)
# solution_2  0.061930   0.018732   0.080662 (  0.080674)


# Old benchmarks:

# %w(admits adolescence horse zulu).each do |w|
#   puts w
#   Benchmark.bm do |x|
#     x.report(:func1) do
#       anagram_1 w
#     end
#     x.report(:func2) do
#       anagram_2 w
#     end
#   end
#   puts
# end

# Example runs of old benchmarks:

# Ruby 3.3.5 (Oct 2024):

# admits
#        user     system      total        real
# func1  0.028058   0.001576   0.029634 (  0.029636)
# func2  0.027233   0.001120   0.028353 (  0.028381)
#
# adolescence
#        user     system      total        real
# func1  0.025180   0.001009   0.026189 (  0.026215)
# func2  0.026587   0.001276   0.027863 (  0.027879)
#
# horse
#        user     system      total        real
# func1  0.027272   0.001114   0.028386 (  0.028417)
# func2  0.027484   0.000860   0.028344 (  0.028367)
#
# zulu
#        user     system      total        real
# func1  0.027930   0.000831   0.028761 (  0.028775)
# func2  0.027237   0.001167   0.028404 (  0.028438)


# Ruby 2.0.0 (Nov 2013):

# admits
#        user       system     total       real
# func1  0.100000   0.000000   0.100000 (  0.100590)
# func2  0.090000   0.010000   0.100000 (  0.094516)
#
# adolescence
#        user       system     total       real
# func1  0.090000   0.000000   0.090000 (  0.090912)
# func2  0.120000   0.010000   0.130000 (  0.131855)
#
# horse
#        user       system     total       real
# func1  0.100000   0.000000   0.100000 (  0.107238)
# func2  0.100000   0.000000   0.100000 (  0.105489)
#
# zulu
#        user       system     total       real
# func1  0.120000   0.000000   0.120000 (  0.120233)
# func2  0.110000   0.010000   0.120000 (  0.109811)
#
