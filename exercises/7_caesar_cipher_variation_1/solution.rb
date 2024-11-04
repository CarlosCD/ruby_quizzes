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
  first = a[0].downcase
  encoded = [first, (first.getbyte(0) + n).chr].join
  a.each_char do |c|
    encoded << ((c =~ /[a-z]/i) ? (c.getbyte(0) + n).chr : c)
  end
  max_length = (encoded.size / 5.0).ceil(0)
  encoded.chars.each_slice(max_length).map(&:join)
end
