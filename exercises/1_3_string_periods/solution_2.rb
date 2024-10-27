# frozen_string_literal: true

def solution(decimal_number)
  # If not an Integer, make it so:
  binary = decimal_number.to_i.to_s(2)
  max_period  = binary.length / 2
  period = 1
  found = false
  while !found && period <= max_period do
    pieces = binary.scan(/.{#{period}}/)
    found = (pieces.uniq.size == 1)
    period += 1 unless found
  end
  period > max_period ? -1 : period
end
