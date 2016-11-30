//
//  Operator.swift
//  Calculator
//
//  Created by Vitalii Yevtushenko on 11/30/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation


/// Available math operators
///
/// - add: Add operator
enum Operator: String {
    case add = "+"
    case sub = "-"
    case mul = "*"

    func solve(left: Token?, right: Token?) -> Token {
        switch self {
        case .add:
            return AddOperator().solve(left: left, right: right)
        case .sub:
            return SubOperator().solve(left: left, right: right)
        case .mul:
            return MulOperator().solve(left: left, right: right)
        }
    }
}
