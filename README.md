# Ruby Quizzes

Several coding exercises, short and mostly proposed by others.

**Table of contents**
- [The exercises](#the-exercises)
- [Running and benchmarking solutions](#running-and-benchmarking-solutions)
  + [Examples](#examples)
- [Tests](#tests)


## The exercises

Each exercise is in its own folder under `exercises/`, and usually consist in three different files:
- `README.md`: the exercise instructions, in Markdown format. What it has to be done.
- `test_data.rb`: some constants to run the solution and benchmarks:
  + `TEST_DATA`: Some test data for benchmarking. Hash with the shape `input => expected output`.
  + `METHODS_MULTIPLE_ARITY `: A Hash with the name(s) of the method(s) that do the work, as keys, and as a value, a boolean, whether the solution method takes one or several arguments.
  + `PARAM_TRANSFORMATION`: as I will invoke the exercise from the command line (see below `run_solution.rb`), this is a lambda to transform an String argument (from the command line) into the class of the solution method argument (for example, a String '[1, 2, 3]' into the Array [1, 2, 3]).
- `solution.rb`, or similar  (`solution_1.rb`, ...): a solution to the exercise. If you want to do the exercise, don't look here yet.

We could have more than one solution. There is an executable to run some performance benchmarks
(see below).

## Running and benchmarking solutions

These are two Ruby executables at the root of this repository:
- `run_solution.rb`: passing the exercise folder and an input value, tries to execute the exercise. If more than one is present, or the file is not called `solution.rb`, the file name with the solution can be passed as a third parameter.
- `compare_solutions.rb`: passing the exercise folder, looks for solutions of the form `solution*.rb` (`solution_1.rb`, `solution_2.rb`, ...), and runs some benchmarks.

For `run_solution.rb`, the parameter to use would be a single String, so the exercise tries to
convert it to the data expected

### Examples

    ./run_solution.rb 1_number_format 1000
      For '1000', the solution is '1,000'

    ./run_solution.rb 2_anagram maple solution
      For 'maple', the solution is '["ample", "maple"]'

    ./run_solution.rb 7_caesar_cipher_variation 'lalalalala,1' encode_str            
      For '["lalalalala", 1]', the solution is '["lmm", "bmb", "mbm", "bmb"]'

    ./run_solution.rb 7_caesar_cipher_variation '["lmm", "bmb", "mbm", "bmb"]' decode 
      For '["lmm", "bmb", "mbm", "bmb"]', the solution is 'lalalalala'

In the case of `compare_solutions.rb`, I only have one solution at this moment:

    ./compare_solutions.rb 3_binary_periods

      Benchmarks for '3_binary_periods':

      Rehearsal ---------------------------------------------
      solution:   0.000023   0.000001   0.000024 (  0.000023)
      ------------------------------------ total: 0.000024sec

                      user     system      total        real
      solution:   0.000021   0.000001   0.000022 (  0.000021)

But for some exercises I used to have several alternative solutions (you can see them by going back
through the Git history):

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

## Tests

I added a `Gemfile` and Minitest specs. To run all the specs (and report on code coverage), first
run `bundle`, and then `rake`:

```Ruby
rake
  Run options: --seed 11292

  # Running:

  ..........

  Finished in 0.115710s, 86.4230 runs/s, 881.5141 assertions/s.

  10 runs, 102 assertions, 0 failures, 0 errors, 0 skips
  Coverage report generated for RSpec to /Users/.../ruby_quizzes/coverage.
  Line Coverage: 100.0% (193 / 193)
```

The coverage line lies (it is not using RSpec). Open the coverage details in your web browser,
`coverage/index.html` by, for example:

```Shell
open coverage/index.html
```

The tests can also run independently, for example:

```Ruby
rake test TEST=spec/7_caesar_cipher_variation_spec.rb
  Run options: --seed 10560

  # Running:

  ..

  Finished in 0.001003s, 1994.0180 runs/s, 18943.1714 assertions/s.

  2 runs, 19 assertions, 0 failures, 0 errors, 0 skips
  Coverage report generated for RSpec to /Users/.../ruby_quizzes/coverage.
  Line Coverage: 100.0% (22 / 22)
```

See the specs available under the `spec/` folder`.
