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

let programArgumentPrefix = "--"

private enum ProgramArguments: String {
    case help
    case verbose
    case silent
    case discardInvalidLines
    case enableAssertions
    
    var name: String {
        return programArgumentPrefix + toDelimitedString(fromCamelCase: rawValue, with: "-")
    }
}

public func parseProgramOptions(_ argumentList: ArgumentList) throws -> ProgramOptions {
    let info = try parse(options: argumentList.options)
    let shouldMerge = !argumentList.merge.isEmpty
    let willMerge   = !info.showHelp
    guard !shouldMerge || willMerge else { throw buildError(.helpCannotTakeParameters) }
    return info
}

private func parse(options: [String]) throws -> ProgramOptions {
    var showHelp            = false
    var enableVerbosity     = false
    var disableLogging      = false
    var discardInvalidLines = false
    var enableAssertions    = false
    try options.forEach {
        switch $0 {
        case ProgramArguments.help.name:
            showHelp = true
        case ProgramArguments.verbose.name:
            enableVerbosity = true
        case ProgramArguments.silent.name:
            disableLogging = true
        case ProgramArguments.discardInvalidLines.name:
            discardInvalidLines = true
        case ProgramArguments.enableAssertions.name:
            enableAssertions = true
        default:
            throw buildError(.invalidSlashedArgument)
        }
    }
    return ProgramOptions(
        showHelp:            showHelp,
        verbose:             enableVerbosity,
        silent:               disableLogging,
        discardInvalidLines: discardInvalidLines,
        enableAssertions:    enableAssertions
    )
}
