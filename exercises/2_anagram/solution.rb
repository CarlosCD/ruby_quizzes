# frozen_string_literal: true

# Expects a String
#   Optional parameter (useful for testing): the path to 'words_list.txt' file
def anagram(word, words_list = File.join(__dir__, 'words_list.txt'))
  dictionary_file = words_list
  word_size = word.size
  # Only words with the size as the target:
  small_dictionary = File.open(dictionary_file).readlines("\n").
                          collect(&:chomp).
                          select{|line| line.size == word_size}
  word_array = word.chars.sort  # 'zulu' => ['l', 'u', 'u', 'z']
  small_dictionary.collect.with_index{|w, i| w.chars.sort == word_array ? small_dictionary[i] : nil}.
                   compact
end
