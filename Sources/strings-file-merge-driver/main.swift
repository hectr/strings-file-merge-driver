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
import StringsFileLib

private let nonZero: Int32 = 1

do {
    let argumentList = try getArgumentList()
    let programOptions = try parseProgramOptions(argumentList)
    setVerbose(programOptions.verbose)
    setSilent(programOptions.silent)
    if programOptions.showHelp {
        displayUsage()
        displayEmptyLine()
        displayInfo()
    } else {
        verbose("Gathering merge information...")
        let mergeInfo = try parseMergeInfo(argumentList)
        verbose("Loading files contents...")
        let filesContents = try loadInputFiles(mergeInfo)
        let filesStrings = try parseFilesContents(filesContents, skipInvalidLines: programOptions.discardInvalidLines)
        verbose("Merging...")
        let mergeResult = try merge(filesStrings, into: mergeInfo.result)
        verbose("Writing results...")
        let lines = toLines(from: mergeResult.stringPairs, withConflictMarker: mergeInfo.conflictMarker, failOnError: programOptions.enableAssertions)
        try write(lines: lines, path: mergeResult.path)
        verbose("Finishing...")
        if mergeResult.isConflict {
            assert(nonZero != 0)
            exit(nonZero)
        }
    }
} catch {
    verbose("Failing...")
    display(error: error)
    displayEmptyLine()
    displayUsage()
    exit(with: error)
}
