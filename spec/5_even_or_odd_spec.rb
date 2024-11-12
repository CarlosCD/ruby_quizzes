# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 5_even_or_odd' do
  before do
    # Creates a class as SolutionClass:NumberFormat with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '5_even_or_odd'
  end

  describe '#even_or_odd' do
    let(:sample_data) do
      {
        -2 => 'Even',
        -1 => 'Odd',
        0  => 'Even',
        1  => 'Odd',
        2  => 'Even',
        11 => 'Odd',
        42 => 'Even'
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, @solution_class.even_or_odd(arg), "#{arg} should output #{result}")
      end
    end
  end
end
