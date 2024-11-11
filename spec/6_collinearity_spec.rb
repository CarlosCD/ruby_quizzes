# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 6_collinearity' do
  before do
    # Other exercises could be using the same method name:
    require_relative '../exercises/6_collinearity/solution'
    alias solution_6 collinearity
  end

  describe '#collinearity' do
    let(:sample_data) do
      {
        # Vectors directed in one direction:
        [1, 1, 1, 1]   => true,
        [1, 2, 2, 4]   => true,
        # Vectors directed in opposite directions:
        [1, 1, 6, 1]   => false,
        [1, 2, -1, -2] => true,
        [1, 2, 1, -2]  => false,
        # Vectors containing zero:
        [4, 0, 11, 0] => true,
        [0, 1, 6, 0]  => false,
        [4, 4, 0, 4] => false,
        # Vectors with coordinates x = 0 and y = 0"
        [0, 0, 0, 0] => true,
        [0, 0, 1, 0] => true,
        [5, 7, 0, 0] => true,
        [0, 0, 0, -989] => true,
        [0, -67, 0, -989] => true,
        [-947, 0, 473, 0] => true
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, solution_6(*arg), "#{arg} should output #{result}")
      end
    end
  end
end
