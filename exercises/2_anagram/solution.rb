# frozen_string_literal: true

# Expects a String
def anagram(word)
  dictionary_file = File.join(__dir__, 'words_list.txt')
  word_size = word.size
  # Only words with the size as the target:
  small_dictionary = File.open(dictionary_file).readlines("\n").
                          collect(&:chomp).
                          select{|line| line.size == word_size}
  word_array = word.chars.sort  # 'zulu' => ['l', 'u', 'u', 'z']
  small_dictionary.collect.with_index{|w, i| w.chars.sort == word_array ? small_dictionary[i] : nil}.
                   compact
end
