# CompleteMe Spec Harness

This is the evaluation test harness for Turing's
[CompleteMe](https://github.com/turingschool/curriculum/blob/master/source/projects/complete_me.markdown).
project.

## Project Structure

For this harness to work, all the `require` statements in your
CompleteMe project must be `require_relative`.

For example a file at `my_project/lib/complete_me.rb` that is
using another file also in the `lib` directory would require
it like:

```
require_relative "other_file"
```

Additionally, the harness does expect your main project
file to be located in `lib/complete_me.rb`. You can
organize the rest of your files however you like, but make sure you start
with this structure.

## Installing Locally

Git clone this project into a directory that lives at the same level
as your `complete_me` project directory. It should be arranged like:

    <my_code_directory>
    |
    |\
    | \complete_me/
    |
    |\
    | \complete_me_spec_harness/
    |

## Usage

Change directories into the `complete_me_spec_harness/` directory and then execute:

    $ bundle

To load in dependencies for the spec harness.

To test your implementation against the evaluation specs, run:

    $ rake test
