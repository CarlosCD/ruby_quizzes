# Verify a partial Sudoku solution is valid

Verify sudoku is valid (do not solve it). Given an grid of this kind (a matrix):

    [['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.'],

     ['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.'],

     ['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.'],
     ['.','.','.',  '.','.','.',  '.','.','.']]


The rules are:
- No repeated numbers in a full row
- No repeated numbers in full column
- No repeated numbers in the 3x3 subgrids

Dots are ignored

See the examples tests for more details.
