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

    # It assumes that test_data has been already required
    #   Return nil if the method_name is not valid, or needed constants are not present
    def method_details(method_name)
      return nil if method_name.nil? || method_name.empty?
      klass = self.class
      %i(METHODS_MULTIPLE_ARITY PARAM_TRANSFORMATION TEST_DATA TEST_FAILURE_EXTRA_DETAILS).each do |c|
        return nil unless klass.const_defined?(c)
      end
      return nil unless METHODS_MULTIPLE_ARITY.keys.include?(method_name.to_sym)
      param_transformation = nil
      test_data = nil
      test_failure_extra_details = nil
      %i(param_transformation test_data test_failure_extra_details).each do |const_name|
        const_for_method = "#{const_name}_#{method_name}".upcase
        const_name_upper = const_name.to_s.upcase
        binding.local_variable_set(const_name, (klass.const_defined?(const_for_method)) ?
          klass.const_get(const_for_method) :
          klass.const_get(const_name_upper))
      end
      return nil if !param_transformation.is_a?(Proc) ||
                    !test_data.is_a?(Hash) ||
                    !test_failure_extra_details.is_a?(Proc)
      [ param_transformation, test_data, test_failure_extra_details ]
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
