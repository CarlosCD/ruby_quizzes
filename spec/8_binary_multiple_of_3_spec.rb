# frozen_string_literal: true

require 'spec_helper'

describe 'Exercise 8_binary_multiple_of_3' do
  before do
    # Creates a class as SolutionClass:BinaryMultipleOf3 with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '8_binary_multiple_of_3'
  end

  describe '#multipleOf3Regex' do
    let(:sample_data) do
      {
        ' 0' => false,
        'abc' => false,
        '011 110' => false,
        '000' => true,
        '001' => false,
        '011' => true,
        '110' => true,
        '111' => false,
        '1001' => true,
        (12345678).to_s(2) => true
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, @solution_class.multipleOf3Regex(arg), "#{arg} should output #{result}")
      end
    end
  end
end
