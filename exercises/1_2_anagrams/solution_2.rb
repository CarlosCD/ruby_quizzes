# frozen_string_literal: true

def anagram(word)
  dictionary_file = File.join(__dir__, 'wl.txt')
  dictionary = File.open(dictionary_file).readlines("\n").collect(&:chomp)
  dictionary_array = dictionary.collect { |w| w.chars.sort }
  as_array = word.chars.sort
  matching = []
  finding = 0
  word_position = 0
  while finding do
    finding = dictionary_array.slice(word_position, dictionary_array.length).index(as_array)
    if finding
      word_position += finding
      matching << dictionary[word_position]
      word_position += 1
    end
  end
  matching
end
