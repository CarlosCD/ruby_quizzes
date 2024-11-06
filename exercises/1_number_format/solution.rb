# frozen_string_literal: true

# Expects a positive Integer lower than 1_000_000_000
def pretty_number(number)
  number.to_s.tap do |s|
    true while s.gsub!(/^([^.]*)(\d)(?=(\d{3})+)/, "\\1\\2,")
  end
end

# Note: only Integers, go to https://gist.github.com/CarlosCD/7376440 for a other cases
