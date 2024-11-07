# frozen_string_literal: true

# Defaults values for the exercises' test_data.rb, if not defined there.
#   Require this file at the end of each test_data.rb, to complete what is missing:
#
#     require_relative '../../utils/test_data_defaults'
#

{
  METHODS_MULTIPLE_ARITY: { solution: false }, # One single argument
  PARAM_TRANSFORMATION: ->(str) { str },  # Expecting a String
  TEST_FAILURE_EXTRA_DETAILS: ->(arg) { '' },
  TEST_DATA: { }
}.each do |const, value|
  self.class.const_set(const, value) unless self.class.const_defined?(const)
end
