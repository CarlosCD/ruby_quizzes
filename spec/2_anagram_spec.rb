# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 2_anagram' do
  before do
    # Other exercises could be using the same method name:
    require_relative '../exercises/2_anagram/solution'
    alias solution_2 anagram
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
        assert_equal(result, solution_2(arg), "#{arg} should output #{result}")
      end
    end
  end
end
