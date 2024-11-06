# frozen_string_literal: true

# Expects an Integer
def solution(decimal_number)
  binary = decimal_number.to_s(2)
  binary_length = binary.length
  max_period  = binary_length / 2
  period = 1
  found = false
  while !found && period <= max_period do
    # Each iteration reduces the number of chunks:
    num_chunks = binary_length / period
    found = binary.start_with?(binary[0, period]*num_chunks)
    period += 1 unless found
  end
  period > max_period ? -1 : period
end
