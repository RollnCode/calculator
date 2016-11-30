//
//  DivOperator.swift
//  Calculator
//
//  Created by Vitalii Yevtushenko on 11/30/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation

class DivOperator {

    func solve(left: Token?, right: Token?) -> Token {
        guard let right = right, let left = left else {
            return .error(nil)
        }

        guard case .number(let leftNum) = left, case .number(let rightNum) = right else {
            return .error(nil)
        }

        guard let lInt = Int(leftNum), let rInt = Int(rightNum) else {
            return .error(nil)
        }

        return .number("\(Int(lInt) / Int(rInt))")
    }
}
