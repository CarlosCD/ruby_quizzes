# frozen_string_literal: true

def encode_str(a)
  # Allow String as an argument:
  arr = a.is_a?(String) ? (eval a rescue []) : a
  return a if !arr.is_a?(Array) || arr.compact.size != 2
  u, n = arr
  n = n.to_i
  # u is the message to be encoded
  # n is the shift
  return [] if !u.is_a?(String) || u.empty?
  a = u.b # ASCII, just in case
  # 2 first characters provide the shift number:
  first = a[0].downcase
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
