# Binary periods

A non-empty zero-indexed string `S` consisting of `Q` characters is given.  
The period of this string `S` is the smallest positive integer `P` such that:

    P ≤ Q / 2 and
    S[K] = S[K+P] for 0 ≤ K < Q − P.

For example:  
10 is the period of "hamburguerhamburguerham". It repeats twice, but then length of the repeated
string (`hamburguer`) is 10.  
8 is the period of "codilitycodilityco". It repeats twice, but then length of the repeated string
(`codility`) is 8.

A positive integer `M` is the binary period of a positive integer `N` if `M` is the period of the
binary representation of `N`.  
For example:  
`4` is the binary period of `955`, because the binary representation of `955` is "1110111011" and
its period is `4`.   
On the other hand, `102`, in binary "1100110", does not have a binary period.

Write a method that, given a positive integer `decimal_number`, returns the binary period of
`decimal_number`.  
The method should return `−1` if `decimal_number` does not have a binary period.

```Ruby
# Expects an Integer
def solution(decimal_number)
  # ...
end
```

For example, given `n = 955` the function should return 4, and given `n = 102` the function should
return −1, as in the examples above.

Assume that `n` is an integer within the range 1 to 1,000,000,000.

Complexity:  
expected worst-case time complexity is O(log(N)2),  
expected worst-case space complexity is O(log(N)).

