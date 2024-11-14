# frozen_string_literal: true

require 'spec_helper'

class CaesarCipherVariationSpecs < Minitest::Spec
  # Next line is equivalent to RSpec's before(:all)
  #   For more details see https://github.com/minitest/minitest/issues/61
  #   It creates a class as SolutionClass:CaesarCipherVariation wrapping with the solution's code,
  #   to be shared by all test runs:
  @@solution_class = SolutionClass.create_wrapping_class_for '7_caesar_cipher_variation'

  describe '7_caesar_cipher_variation' do
    describe '#encode_str' do
      let(:sample_data) do
        {
          ['I should have known that you would have a perfect answer for me!!!', 1] =>
            ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!'],
          ['Now you know your ABCs!', 1] => ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'],
          ['The same sentence, but split in 5 chunks', 0] =>
            ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'],
          # Less than 5 chunks (small String):
          ['A', 2] => ['a','c','C'],
          # Checking letters cycle (if shift is 1, Z => A, z => a):
          ['Z becomes A and z becomes a, right?', 1] =>
            ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'],
          ['Hello world!', 6] => ['hnN', 'krr', 'u c', 'uxr', 'j!'],
          ['Z', 1] => ['z','a','A'],
          # Cases where the first character is not a letter:
          ['1 is a valid string', 2] => ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"],
          ['123456789Z', 1] => ["za1", "234", "567", "89A"],
          # Not valid, I need at least one letter to encode the shift:
          ['12345--#', 2] => []
        }
      end

      it 'sample cases match' do
        sample_data.each do |arg, result|
          assert_equal(result, @@solution_class.encode_str(*arg), "#{arg} should output #{result}")
        end
      end
    end

    describe '#decode' do
      let(:sample_data) do
        {
          ['ijJ tipvme ibw', 'f lopxo uibu z', 'pv xpvme ibwf ', 'b qfsgfdu botx', 'fs gps nf!!!'] =>
            'I should have known that you would have a perfect answer for me!!!',
          ['noOpx', ' zpv ', 'lopx ', 'zpvs ', 'BCDt!'] => 'Now you know your ABCs!',
          ['ttThe sam', 'e sentenc', 'e, but sp', 'lit in 5 ', 'chunks'] =>
            'The same sentence, but split in 5 chunks',
          # Less than 5 chunks (small String):
          ['a','c','C'] => 'A',
          # Checking letters cycle (if shift is 1, Z => A, z => a):
          ['zaA cfdp', 'nft B bo', 'e a cfdp', 'nft b, s', 'jhiu?'] =>
            'Z becomes A and z becomes a, right?',
          ['hnN', 'krr', 'u c', 'uxr', 'j!'] => 'Hello world!',
          ['z','a','A'] => 'Z',
          # Cases where the first character is not a letter:
          ['ik1 k', 'u c x', "cnkf ", "uvtkp", "i"] => '1 is a valid string',
          ["za1", "234", "567", "89A"] => '123456789Z'
        }
      end

      it 'sample cases match' do
        sample_data.each do |arg, result|
          assert_equal(result, @@solution_class.decode(arg), "#{arg} should output #{result}")
        end
      end
    end
  end
end
