# frozen_string_literal: true

require 'spec_helper'

describe 'Exercise 9_valid_sudoku' do
  before do
    # Creates a class as SolutionClass:ValidSudoku with the solution's code:
    @solution_class = SolutionClass.create_wrapping_class_for '9_valid_sudoku'
  end

  describe '#solution' do
    let(:sample_data) do
      {
        [['.','.','.','1','4','.','.','2','.'],
         ['.','.','6','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','.'],
         ['.','.','1','.','.','.','.','.','.'],
         ['.','6','7','.','.','.','.','.','9'],
         ['.','.','.','.','.','.','8','1','.'],
         ['.','3','.','.','.','.','.','.','6'],
         ['.','.','.','.','.','7','.','.','.'],
         ['.','.','.','5','.','.','.','7','.']] => true,

        [['.','.','.','.','2','.','.','9','.'],
         ['.','.','.','.','6','.','.','.','.'],
         ['7','1','.','.','7','5','.','.','.'],
         ['.','7','.','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','9'],
         ['.','.','.','.','8','3','.','.','.'],
         ['.','.','8','.','.','7','.','6','.'],
         ['.','.','.','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','.']] => false,  # file 3 repeats '7'

        [['.','.','.','.','2','.','.','9','.'],
         ['.','.','.','.','6','.','.','.','.'],
         ['7','1','.','.','.','5','.','.','.'],
         ['.','7','.','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','9'],
         ['.','.','.','.','8','3','.','.','.'],
         ['.','.','8','.','.','7','.','6','.'],
         ['.','.','.','.','.','.','.','.','.'],
         ['.','.','.','.','2','.','.','.','.']] => false,  # column 5 repeats '2'

        [['.','.','1','.','2','.','.','9','.'],
         ['.','.','.','.','6','.','.','.','.'],
         ['7','1','.','.','3','5','.','.','.'],
         ['.','7','.','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','9'],
         ['.','.','.','.','8','3','.','.','.'],
         ['.','.','8','.','.','7','.','6','.'],
         ['.','.','.','.','.','.','.','.','.'],
         ['.','.','.','.','.','.','.','.','.']] => false  # first square repeats '1'
      }
    end

    it 'sample cases match' do
      sample_data.each do |arg, result|
        assert_equal(result, @solution_class.solution(arg), "#{arg} should output #{result}")
      end
    end
  end
end