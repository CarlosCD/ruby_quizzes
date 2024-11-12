# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 1_number_format solution' do
  before do
    # Creates a class as SolutionClass:NumberFormat with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '1_number_format'
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
        assert_equal(result, @solution_class.pretty_number(arg), "#{arg} should output #{result}")
      end
    end
  end
end
