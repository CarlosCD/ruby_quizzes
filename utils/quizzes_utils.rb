# frozen_string_literal: true

module QuizzesUtils
  class << self
    def examples_message_run(sample_values = [], value = nil, splat_arguments: false,
                             exercise_folder: '1_1_number_format')
      arg = value unless blank?(value)
      exercise_path = "exercises/#{exercise_folder}/"
      "Examples:\n" +
        available_solutions(exercise_path).
          collect do |s|
            argument = arg || sample_values.sample
            argument = "'" + argument.join(', ') + "'" if splat_arguments
            "  .\/run_solution.rb #{exercise_folder} #{argument} #{s}"
          end.join("\n") +
        "\n\n"
    end

    def examples_message_test
      available_solutions.collect{|s| "  tests.rb #{s}"}.join("\n") + "\n\n"
    end

    def find_solutions(exercise_path = caller_directory)
      Dir["#{exercise_path}solution*.rb"].collect{|n| n[exercise_path.size..-4]}
    end

    private

    def blank?(string_or_nil)
      string_or_nil.nil? || string_or_nil.empty?
    end

    def caller_directory
      File.dirname(caller_locations.last.path) + '/'
    end

    def available_solutions(exercise_path = caller_directory)
      solutions_found = find_solutions(exercise_path)
      solutions_found = %(solution) if solutions_found.empty?
      solutions_found = [nil] + solutions_found if solutions_found.include?('solution')
      solutions_found
    end
  end
end
