# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 8_binary_multiple_of_3' do
  before do
    # Other exercises could be using the same method name:
    require_relative '../exercises/8_binary_multiple_of_3/solution'
    alias solution_8 multipleOf3Regex
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
        assert_equal(result, solution_8(arg), "#{arg} should output #{result}")
      end
    end
  end
end
