# Ruby Quizzes

Several coding exercises, short and mostly proposed by others.

## The exercises

Each exercise is in its own folder under `exercises/`, and usually consist in three different files:
- `README.md`: the exercise instructions, in Markdown format. What to be done.
- `test_data.rb`: some constants to test the solution and run benchmarks:
  + `TEST_DATA`: Some test data. Hash as `input => expected output`.
  + `SOLUTION_METHOD_NAME`: name of the method that does the work. It can be changed if decided.
  + `TEST_FAILURE_EXTRA_DETAILS`: a lambda to display extra details if a test fails.
- `solution.rb`, or similar  (`solution_1.rb`, ...): a solution to the exercise. If you want to do the exercise, don't look here yet.

We could have more than one solution. There is an executable to run some performance benchmarks
(see below).

## Testing and running the exercises

These are three Ruby executables at the root of this repository:
- `run_solution.rb`: passing the exercise folder and an input value, tries to execute the exercise. If more than one is present, or the file is not called `solution.rb`, the file name with the solution can be passed as a third parameter.
- `tests.rb`: run the tests for a given exercise (passing the exercise folder), using the test data at `test_data.rb`. For now, it doesn't use RSpec or Minitest, it just compares results and shows "passed" or "failed". If more than one solution is present, or the file is not called `solution.rb`, the file with the solution should be passed as a second parameter.
- `compare_solutions.rb`: passing the exercise folder, looks for solutions of the form `solution*.rb` (`solution_1.rb`, `solution_2.rb`, ...), and runs some benchmarks.

Examples:

    ./run_solution.rb 1_number_format 1000
      For '1000', the solution is '1,000'

    ./tests.rb 2_anagram solution_2
      passed
      passed
      passed
      passed
      passed
      passed
      passed
      passed
      passed
      passed
      passed
      passed

    ./compare_solutions.rb 3_binary_periods

      Benchmarks for '3_binary_periods':

      Rehearsal -----------------------------------------------
      solution_1:   0.000221   0.000017   0.000238 (  0.000237)
      solution_2:   0.000677   0.000018   0.000695 (  0.000694)
      solution_3:   0.000031   0.000001   0.000032 (  0.000031)
      solution_4:   0.000022   0.000001   0.000023 (  0.000022)
      -------------------------------------- total: 0.000988sec

                        user     system      total        real
      solution_1:   0.000211   0.000004   0.000215 (  0.000214)
      solution_2:   0.000228   0.000012   0.000240 (  0.000241)
      solution_3:   0.000028   0.000010   0.000038 (  0.000039)
      solution_4:   0.000022   0.000000   0.000022 (  0.000022)
