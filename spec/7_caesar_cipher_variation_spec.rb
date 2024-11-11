# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Exercise 7_caesar_cipher_variation' do
  before do
    # Other exercises could be using the same method name:
    require_relative '../exercises/7_caesar_cipher_variation/solution'
    alias solution_7_1 encode_str
    alias solution_7_2 decode
  end

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
        assert_equal(result, solution_7_1(*arg), "#{arg} should output #{result}")
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
        assert_equal(result, solution_7_2(arg), "#{arg} should output #{result}")
      end
    end
  end
end
