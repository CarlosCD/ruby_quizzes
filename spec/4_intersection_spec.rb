# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 4_intersection' do
  before do
    # Creates a class as SolutionClass:Intersection with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '4_intersection'
  end

  describe '#solution' do
    let(:sample_data) do
      {
        [1, 2, 3, 4, 5, 6, 7, 8] => 0,
        [1, 1, 1, 1] => 4,
        [22, 10, 21, 11, 2] => 4,
        [3, 2, 5, 4, 4, 6, 3, 2] => 6,
        [1, 3, 2, 5, 4, 4, 6, 3, 2] => 7,
        [16, 17, 23, 24, 12, 4, 21, 1, 18] => 7
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, @solution_class.solution(arg), "#{arg} should output #{result}")
      end
    end
  end
end
