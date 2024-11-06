# frozen_string_literal: true

# Expects an Array with 2 elements: a String and an Integer
def encode_str(arr)
  # u is the message to be encoded
  # n is the shift
  u, n = arr
  return [] if !u.is_a?(String) || u.empty?
  a = u.b # ASCII, just in case
  # The first has to be a plain letter (a-z|A-Z), if there is any:
  first = a.chars.find{|c| c =~ /[a-z]/i}
  return [] if first.nil?
  # 2 first characters provide the shift number:
  first = first.downcase
  encoded = [first, plain_letter_shift(first, n)].join
  # Encoding as a String:
  a.each_char{|c| encoded << plain_letter_shift(c, n) }
  # Split in 5 Arrays:
  max_length = (encoded.size / 5.0).ceil(0)
  encoded.chars.each_slice(max_length).map(&:join)
end

def plain_letter_shift(ch, offset)
  return ch unless ch =~ /[a-z]/i
  # Using code number, for speed:
  #   A: 65, Z = 90, a = 97, z = 122
  #   A-Z are 26 letters ('Z'.getbyte(0) - 'A'.getbyte(0) + 1)
  zero = (ch =~ /[A-Z]/) ? 65 : 97  
  incr = (ch.getbyte(0) + offset - zero) % 26
  (zero + incr).chr
end
