# frozen_string_literal: true

module QuizzesUtils
  class << self
    def examples_message_run(sample_values = [], value = nil)
      arg = value unless blank?(value)
      "Examples:\n" + available_solutions.collect{|s| "  run_solution.rb #{arg || sample_values.sample} #{s}"}.join("\n") + "\n\n"
    end

    def examples_message_test
      available_solutions.collect{|s| "  run_solution.rb #{s}"}.join("\n") + "\n\n"
    end

    private

    def blank?(string_or_nil)
      string_or_nil.nil? || string_or_nil.empty?
    end

    def caller_directory
      File.dirname(caller_locations.last.path) + '/'
    end

    def find_solutions(exercise_path = caller_directory)
      Dir["#{exercise_path}solution*.rb"].collect{|n| n[exercise_path.size..-4]}
    end

    def available_solutions(exercise_path = caller_directory)
      solutions_found = find_solutions(exercise_path)
      solutions_found = %(solution) if solutions_found.empty?
      solutions_found = [nil] + solutions_found if solutions_found.include?('solution')
      solutions_found
    end
  end
end
