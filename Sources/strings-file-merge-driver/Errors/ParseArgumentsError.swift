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

public enum ParseArgumentsError: Error {
    public enum WrongArgumentCountErrorCode: Int {
        case tooFewArguments
        case tooManyArguments
    }
    
    public enum InvalidArgumentErrorCode: Int {
        case missingCommandPathArgument
        case invalidSlashedArgument
        case helpCannotTakeParameters
        case invalidConflictMarkerSize
    }
    
    case wrongArgumentCount(code: WrongArgumentCountErrorCode)
    case invalidArgument(code: InvalidArgumentErrorCode)
    
    init(code: WrongArgumentCountErrorCode) {
        self = .wrongArgumentCount(code: code)
    }
    
    init(code: InvalidArgumentErrorCode) {
        self = .invalidArgument(code: code)
    }
}

extension ParseArgumentsError.WrongArgumentCountErrorCode: ErrorCode { }

extension ParseArgumentsError.InvalidArgumentErrorCode: ErrorCode { }

func buildError(_ withCode: ParseArgumentsError.InvalidArgumentErrorCode) -> ParseArgumentsError {
    return ParseArgumentsError(code: withCode)
}

func buildError(_ withCode: ParseArgumentsError.WrongArgumentCountErrorCode) -> ParseArgumentsError {
    return ParseArgumentsError(code: withCode)
}
