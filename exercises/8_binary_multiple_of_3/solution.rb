# frozen_string_literal: true

# Regular expression matching binary inputs multiple of 3
#
# DFA (Deterministic Finite Automaton):
# 
# Modulo 3 (reminder of dividing by 3)
#
# Appending a binary character means:
#   0 is multiplying by 2 (2*X). Shift operation
#   1 is multiplying by 2 and adding a 1 (2*X +1)
#
# 3X modulo 0
#   + 0 => 3X*2 = 6Y mod 0
#   + 1 => 6X+1      mod 1
#     + 0 => (6X+1)*2 = 12Y + 2  mod 2
#       + 0 => (12Y + 2)*2 = 24Y + 4   mod 1
#       + 1 => (12Y + 2)*2 + 1 = 24Y+5 mod 2
#     + 1 => (6y+1)*2+1 = 12Y+2+1 = 3(6Y+1) mod 0
#
# DFA (node numbers indicate the reminder):
#
#         1          0        <-- 1
# [[0]] ----> [ 1 ]----> [ 2 ] --|
#  |^   <----      <----
#  ||     1          0
#  --
#   0    
#
# DFA to regex, by pruning the graph:
#
# multipleOf3Regex = /\A0*(1(01*0)*1|0)+\z/
#

# Expects a String representing a binary number
def multipleOf3Regex(binary_string)
  !(/\A0*(1(01*0)*1|0)+\z/ =~ binary_string).nil?
end
