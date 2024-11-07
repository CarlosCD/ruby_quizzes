# frozen_string_literal: true

# Expects 2 arguments: a String and an Integer
def encode_str(str, num)
  # str is the message to be encoded
  # num is the shift
  return [] if !str.is_a?(String) || str.empty?
  a = str.b # ASCII, just in case
  # The first has to be a plain letter (a-z|A-Z), if there is any:
  first = a.chars.find{|c| c =~ /[a-z]/i}
  return [] if first.nil?
  # 2 first characters provide the shift number:
  first = first.downcase
  encoded = [first, plain_letter_shift(first, num)].join
  # Encoding as a String:
  a.each_char{|c| encoded << plain_letter_shift(c, num) }
  # Split in 5 Arrays:
  max_length = (encoded.size / 5.0).ceil(0)
  encoded.chars.each_slice(max_length).map(&:join)
end

# Expects an Array with 3-5 Strings
def decode(arr)
  # Verify the argument is valid:
  return arr if !arr.is_a?(Array) || arr.size < 1 || arr.size > 5 || !arr.first.is_a?(String)
  encoded = arr.join.b # ASCII String
  return arr if encoded.size <= 2
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
