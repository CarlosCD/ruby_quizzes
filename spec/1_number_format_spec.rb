# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 1_number_format solution' do
  before do
    # Other exercises could be using the same method name:
    require_relative '../exercises/1_number_format/solution'
    alias solution_1 pretty_number
  end

  describe '#pretty_number' do
    let(:sample_data) do
      {
        0 => '0',
        1 => '1',
        10 => '10',
        999 => '999',
        1000 => '1,000',
        10000 => '10,000',
        100000 => '100,000',
        1000000 => '1,000,000',
        35235235 => '35,235,235',
        1_000_000_000 => '1,000,000,000'
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, solution_1(arg), "#{arg} should output #{result}")
      end
    end
  end
end