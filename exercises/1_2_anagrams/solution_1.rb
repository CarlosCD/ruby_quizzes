# frozen_string_literal: true

def anagram(word)
  dictionary_file = File.join(__dir__, 'wl.txt')
  dictionary = File.open(dictionary_file).readlines("\n").collect(&:chomp)
  dictionary_array = dictionary.collect { |w| w.chars.sort }
  as_array = word.chars.sort
  matching = []
  dictionary_array.each_with_index{ |dictw, i| matching << i if dictw == as_array }
  matching.collect{ |i| dictionary[i] }
end
