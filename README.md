# strings-file-merge-driver

## Installation

### Using [Mint](https://github.com/yonaskolb/mint)

To install the latest version of `strings-file-merge-driver` simply run this command:

```
$ mint install hectr/strings-file-merge-driver
```

### Using [CocoaPods](https://cocoapods.org)

Add `pod 'strings-file-merge-driver'` to your `Podfile` and run `pod update strings-file-merge-driver`. This will download the latest release binary and will allow you to invoke it via `$PODS_ROOT/strings-file-merge-driver/bin/strings-file-merge-driver` in your Script Build Phases.

## Usage

```
strings-file-merge-driver [--help | ancestor_file current_file other_file conflict_marker_size dest_pathname] [--verbose] [--silent] [--discard-invalid-lines]
```

To use this merge driver, add a section to your `$GIT_DIR/config` file (or `$HOME/.gitconfig` file) like this:

```
[merge "strings-file"]
name = Strings file merge driver
driver = strings-file-merge-driver --discard-invalid-lines --silent %O %A %B %L %P
```

Then add this to `.gitattributes`:

```
*.strings   merge=strings-file
```

When the command line is built, the tokens in merge.*.driver variable will be replaced with:

- %O = name of the temporary file that holds the contents of ancestor’s version
- %A = name of the temporary file that holds the contents of current version
- %B = name of the temporary file that holds the contents of other branches' version
- %L = conflict marker size
- %P = pathname in which the merged result will be stored

The merge driver is expected to leave the result of the merge in the file named with %A by overwriting it, and exit with zero status if it managed to merge them cleanly, or non-zero if there were conflicts.

[Read more about git merge drivers](https://git-scm.com/docs/gitattributes).

[Read more about string resources](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/Strings/Strings.html>).

## License

This library is released under the [MIT License](http://opensource.org/licenses/MIT). See LICENSE for details.
