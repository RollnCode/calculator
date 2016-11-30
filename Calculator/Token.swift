//
//  Token.swift
//  Calculator
//
//  Created by Vitalii Yevtushenko on 11/30/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation

/// Token representation. Token is an any part of expression. Number, operator, error or subexpression.
///
/// - number: Number
/// - `operator`: Operator
/// - error: Error
enum Token {
    case number(String)
    case `operator`(Operator)
    case error(Error?)
}

extension Token: Equatable {

    static func ==(lhs: Token, rhs: Token) -> Bool {
        if case .number(let lnum) = lhs, case .number(let rnum) = rhs {
            return lnum == rnum
        } else if case .`operator`(let lop) = lhs, case .`operator`(let rop) = rhs {
            return lop == rop
        } else if case .error = lhs, case .error = rhs {
            return true
        }

        return false
    }
}
