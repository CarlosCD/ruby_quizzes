# frozen_string_literal: true

# The solutions to these exercises are usually presented as a series of methods in the global scope.
#   This provides a way to wrap them in a made-up class, so they can be tested in isolation.
#   The name of this new class is namespaced within this SolutionClass module (less chances of
#   collision with existing constant names).
#   Naming examples:
#     '1_number_format'  => SolutionClass::NumberFormat
#     '2_anagram'        => SolutionClass::Anagram
#     '3_binary_periods' => SolutionClass::BinaryPeriods
#     ...
#   The new class provides the original solution methods as class methods.
#   Usage example:
#     @klass = SolutionClass.create_wrapping_class_for '1_number_format'
#     assert_equal '10,000', @klass.pretty_number(10000)
#

module SolutionClass
  class << self
    def create_wrapping_class_for(solution_name, solution_file = 'solution.rb')
      # 1. Sanity checks:
      return nil unless solution_name.is_a?(String) && !solution_name.empty?
      solution_filename = File.join(__dir__, '..', '..', 'exercises', solution_name, solution_file)
      unless File.exist?(solution_filename)
        puts "'#{solution_filename}' does not exist!"
        return nil
      end
      # 2. Solution's code copied:
      solution_code = File.open(solution_filename).read
      line_number = 1
      #   Avoiding this:
      #     warning: `frozen_string_literal' is ignored after any tokens
      magic_comment = solution_code.slice!(/\A# frozen_string_literal: true\n(.*)/)
      line_number +=1 if magic_comment  # advancing the line to match the original
      # 3. New Class creation:
      klass = const_set constant_name(solution_name), Class.new
      #   Stick the solution code in the new class, referencing the original file:
      klass.class_eval "class << self; #{solution_code};end", solution_filename, line_number
      klass
    end

    private

    def constant_name(s)
      candidate = s.gsub(/[0-9]*_*(.*)/i, '\\1' )
      c = candidate.split('_').map(&:capitalize).join
      if const_defined?(c)
        n = 1
        n += 1 while const_defined?("#{c}#{n}") && n < 20
        "#{c}#{n}"
      else
        c
      end
    end
  end
end
