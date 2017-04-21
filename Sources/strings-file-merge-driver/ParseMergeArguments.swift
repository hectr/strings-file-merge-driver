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

private enum MergeArguments: Int {
    case ancestor
    case current
    case other
    case markerSize
    case pathname
    
    static var count: Int {
        var max: Int = 0
        while let _ = self.init(rawValue: max) { max += 1 }
        return max
    }
}

public func parse(merge arguments: [Argument]) throws -> MergeInfo {
    let count = arguments.count
    guard count >= MergeArguments.count else { throw buildError(.tooFewArguments) }
    guard count <= MergeArguments.count else { throw buildError(.tooManyArguments) }
    guard let markerSize = Int(arguments[3]) else { throw buildError(.invalidConflictMarkerSize) }
    let ancestor = arguments[0]
    let current  = arguments[1]
    let other    = arguments[2]
    let pathname = arguments[4]
    return MergeInfo(
        ancestor:       ancestor,
        current:        current,
        other:          other,
        conflictMarker: ConflictMarkerInfo(markerSize: markerSize),
        pathname:       pathname,
        result:         current
    )
}
