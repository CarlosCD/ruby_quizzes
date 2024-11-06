# Number format

Devise a function that takes an input `number` (an Integer) and returns a String that is the
decimal representation of that number grouped by commas after every 3 digits. You can't
solve the task using a built-in formatting function that can accomplish the whole
task on its own.

```Ruby
# Expects a positive Integer lower than 1_000_000_000
def pretty_number(number)
  # ...
end
```

Examples:

    10 -> "10"
    1000 -> "1,000"
    10000 -> "10,000"
    100000 -> "100,000"
    35235235 -> "35,235,235"
