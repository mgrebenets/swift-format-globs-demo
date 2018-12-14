# SwiftFormat Globs Demo

Using SwiftFormat version `0.36.0`.

Most of the `.swift` files are already formatted.
The point is not to test formatting speed but how long it takes to resolve glob matches.

## #329

When using no `--exclude` option, takes around `10s` in total, starts processing files almost immediately.

Use `--exclude **/*65521ed8*,07d4b442` in `.swiftformat` to see some of slowdown.

With this config it takes around `2m` in total, most of that time is spend resolving matches.

Compare to `--exclude **/*nomatch*,07d4b442`. Takes around `16s`, and only 1s of that time seems to be used for resolving matches.

Running all commands as:

```bash
time swiftformat --config .swiftformat . --verbose
```

## Comparing to Ruby

There's a `glob.rb` that uses Ruby's `Dir` function to be used for comparison.

Both `time ruby glob.rb "**/*65521ed8*"` and `time ruby glob.rb "**/*nomatch*" take around `0.4s` to find all the matches

The `rubocop -D` is another example, running `rubocop -D` over the same code takes much less time (approx `4s`). There's still a considerable delay at the start, before it starts inspecting the files. Though the config for including and excluding Ruby files is not the same as for SwiftFormat.
