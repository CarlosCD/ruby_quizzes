# frozen_string_literal: true

def solution(decimal_number)
  binary = decimal_number.to_s(2)
  period  = binary.length / 2
  found = false
  while !found
    prefix = binary.slice(0, period)
    tail = binary.slice(period, binary.length - period)
    found = tail.start_with?(prefix) || period == 0
    period -= 1 unless found
  end
  period == 0 ? -1 : period
end

# Notes:
#  This was a timed test, on November 2013.
#  This solution is neither correct, nor the best approach
