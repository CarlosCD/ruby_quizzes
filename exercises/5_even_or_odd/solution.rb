# frozen_string_literal: true

# Expects either an Integer or a String representing an Integer
def even_or_odd(number)
  number.to_i.even? ? 'Even' : 'Odd'
end
