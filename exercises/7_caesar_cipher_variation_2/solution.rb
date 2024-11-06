# frozen_string_literal: true

# Expects an Array with 5 Strings
def decode(arr)
  # Verify the argument is valid:
  return arr if !arr.is_a?(Array) || arr.size < 1 || arr.size > 5 || !arr.first.is_a?(String) || arr.first.size <= 2
  encoded = arr.join.b # ASCII String
  prefix = encoded.slice!(0,2).bytes
  n = prefix[1] - prefix[0]
  encoded.each_char.map{|c| plain_letter_shift(c, -n) }.join
end

def plain_letter_shift(ch, offset)
  return ch unless ch =~ /[a-z]/i
  # Using code number, for speed:
  #   A: 65, Z = 90, a = 97, z = 122
  #   A-Z are 26 letters ('Z'.getbyte(0) - 'A'.getbyte(0) + 1)
  zero = (ch =~ /[A-Z]/) ? 65 : 97
  # Note: even if offset is negative, modulo is always positive
  incr = (ch.getbyte(0) + offset - zero) % 26
  (zero + incr).chr
end
