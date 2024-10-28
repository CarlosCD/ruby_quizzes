# frozen_string_literal: true

module QuizzesTests
  class << self
    def test(code_lambda, args, expected_result, error_message: nil, error_extra: ->(arg) { '' })
      result = code_lambda.call(args)
      if result == expected_result
        puts 'passed'
      else
        print (error_message || 'failed')
        puts " - for '#{args}'#{error_extra.call(args)}, " \
             "expected '#{expected_result}' but got '#{result}'"
      end
    end
  end
end
