# frozen_string_literal: true

require 'spec_helper'

describe 'Exercise 2_anagram' do
  before do
    # Creates a class as SolutionClass::Anagram with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '2_anagram'
    # Extra detail, needed to locate the 'words_list.txt' file from here:
    @words_list = File.join(__dir__, '../exercises/2_anagram/words_list.txt')
  end

  describe '#anagram' do
    let(:sample_data) do
      {
        'admits' => %w(admits amidst),
        'adolescence' => ['adolescence'],
        'ample' => %w(ample maple),
        'anemic' => %w(anemic cinema),
        'battle' =>  %w(battle tablet),
        'dynamo' => %w(dynamo monday),
        'eric' => %w(eric rice),
        'horse' => %w(heros horse shore),
        'rescue' => %w(rescue secure),
        # 7 chars, max. number of words in the file with this size (3,617 words):
        'abandon' => ['abandon'],
        'abdomen' => ['abdomen'],
        'zoology' => ['zoology'],
        'zooming' => ['zooming'],
        # 20 chars, min. number of words in the file with this size (2 words):
        'institutionalization' => ['institutionalization'],
        'internationalization' => ['internationalization'],
        # Only one spelling in the file:
        'zulu' => ['zulu'],
        'luuz' => ['zulu'],
        # Not in file (min. length of the words in file is 4 chars):
        'luz' => []
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, @solution_class.anagram(arg, @words_list),
                     "#{arg} should output #{result}")
      end
    end
  end
end
