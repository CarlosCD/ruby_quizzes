# frozen_string_literal: true

# Integers only:
def pretty_number(number)
  raise 'Not an Integer' unless number.is_a?(Integer)
  raise 'Not in range' unless (0..1_000_000_000).include?(number)
  number.to_s.tap do |s|
    true while s.gsub!(/^([^.]*)(\d)(?=(\d{3})+)/, "\\1\\2,")
  end
end

# Note: only for Integers, go to https://gist.github.com/CarlosCD/7376440 for a other cases
