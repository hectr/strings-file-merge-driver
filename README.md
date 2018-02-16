# strings-file-merge-driver

```
usage: strings-file-merge-driver [--help | ancestor_file current_file other_file conflict_marker_size dest_pathname] [--verbose] [--silent] [--discard-invalid-lines]

To use this merge driver, add a section to your $GIT_DIR/config file (or $HOME/.gitconfig file) like this:
	> [merge "strings-file"]
	> 	name = Strings file merge driver
	> 	driver = strings-file-merge-driver --discard-invalid-lines --silent %O %A %B %L %P

Then add this to .gitattributes:
	> *.strings   merge=strings-file

When the command line is built, the tokens in merge.*.driver variable will be replaced with:
	%O = name of the temporary file that holds the contents of ancestor’s version
	%A = name of the temporary file that holds the contents of current version
	%B = name of the temporary file that holds the contents of other branches' version
	%L = conflict marker size
	%P = pathname in which the merged result will be stored

The merge driver is expected to leave the result of the merge in the file named with %A by overwriting it, and exit with zero status if it managed to merge them cleanly, or non-zero if there were conflicts.

Read more about git merge drivers at <https://git-scm.com/docs/gitattributes>.
Read more about string resources at <https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/Strings/Strings.html>.
```
