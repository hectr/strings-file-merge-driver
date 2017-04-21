// Copyright (c) 2017 Hèctor Marquès Ranea
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import strings_file_lib

public func displayInfo() {
    printToStdErr("To use this merge driver, add a section to your $GIT_DIR/config file (or $HOME/.gitconfig file) like this:")
    printToStdErr("\t> [merge \"strings-file\"]")
    printToStdErr("\t> \tname = Strings file merge driver")
    printToStdErr("\t> \tdriver = strings-file-merge-driver --discard-invalid-lines --silent %O %A %B %L %P")
    
    printToStdErr("")
    printToStdErr("Then add this to .gitattributes:")
    printToStdErr("\t> *.strings   merge=strings-file")
    
    printToStdErr("")
    printToStdErr("When the command line is built, the tokens in merge.*.driver variable will be replaced with:")
    printToStdErr("\t%O = name of the temporary file that holds the contents of ancestor’s version")
    printToStdErr("\t%A = name of the temporary file that holds the contents of current version")
    printToStdErr("\t%B = name of the temporary file that holds the contents of other branches' version")
    printToStdErr("\t%L = conflict marker size")
    printToStdErr("\t%P = pathname in which the merged result will be stored")
    
    printToStdErr("")
    printToStdErr("The merge driver is expected to leave the result of the merge in the file named with %A by overwriting it, and exit with zero status if it managed to merge them cleanly, or non-zero if there were conflicts.")
    
    printToStdErr("")
    printToStdErr("Read more about git merge drivers at <https://git-scm.com/docs/gitattributes>.")
    printToStdErr("Read more about string resources at <https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/Strings/Strings.html>.")
}
