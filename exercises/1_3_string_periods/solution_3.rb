# frozen_string_literal: true

# Considering some special cases, to try to speed them up.
#   Unfortunately this did not improve the rest of the cases, so I removed this in the next
#   solution.
#   Use run_comparison.rb to see the performance differences

def solution(decimal_number)
  # If not an Integer, make it so:
  binary = decimal_number.to_i.to_s(2)
  binary_length = binary.length
  max_period  = binary_length / 2
  # Considering some special cases:
  #   1. If the first zero is over the first half, no solution (returns -1)
  #   2. If all are 1s, the solution is 1
  #   3. Otherwise, we can start checking the period from the position of the first zero, instead of 1
  first_zero = nil
  binary.each_char.with_index do |char, index|
    if char == '0'
      # Case 1:
      return -1 if index > max_period
      first_zero = index
      break
    end
  end
  # Case 2:
  return 1 unless first_zero # All are 1s
  # Case 3 from here:
  period = first_zero + 1
  found = false
  while !found && period <= max_period do
    # Each iteration reduces the number of chunks:
    num_chunks = binary_length / period
    found = binary.start_with?(binary[0, period]*num_chunks)
    period += 1 unless found
  end
  period > max_period ? -1 : period
end
