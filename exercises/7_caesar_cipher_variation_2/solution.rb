# Decodes an Array of five strings:
def decode(a)
  # Allow String as an argument:
  arr = a.is_a?(String) ? (eval a rescue []) : a
  # Verify the argument is valid:
  return arr if !arr.is_a?(Array) || arr.size < 1 || arr.size > 5 || !arr.first.is_a?(String) || arr.first.size <= 2
  encoded = arr.join.b # ASCII String
  prefix = encoded.slice!(0,2).bytes
  n = prefix[1] - prefix[0]
  decoded = ''
  encoded.each_char do |c|
    dec_char = (c.getbyte(0) - n).chr
    decoded << ((dec_char =~ /[a-z]/i) ? dec_char : c)
  end
  decoded
end
