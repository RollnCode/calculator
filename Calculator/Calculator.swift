//
//  Calculator.swift
//  Calculator
//
//  Created by Vitalii Yevtushenko on 11/30/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation

open class Calculator {

    var tokens = [Token]()

    open func solve(_ expression: String) -> String {
        tokenize(expression)
        processUnaryMinus()
        processUnaryPlus()
        process(operators: [.mul, .div])
        processFromLeftToRight()

        if let token = tokens.first, case .number(let digits) = token {
            return digits
        }

        return "Error"
    }

    private func process(operators: [Operator]) {
        var hasTokens = false

        repeat {
            hasTokens = false

            for (index, token) in tokens.enumerated() {
                if case .operator(let op) = token, operators.contains(op) {
                    let left: Token? = (index - 1 >= 0) ? tokens[index - 1] : nil
                    let right: Token? = (index + 1 < tokens.count) ? tokens[index + 1] : nil
                    let result = op.solve(left: left, right: right)

                    if case .error = result {
                        tokens = [result]
                        return
                    }

                    tokens.replaceSubrange((left == nil ? index : (index-1))...(right == nil ? index : (index+1)), with: [result])
                    hasTokens = true
                    
                    break
                }
            }

        } while hasTokens
    }

    private func processUnaryPlus() {
        var hasUnary = false

        repeat {
            hasUnary = false

            for (index, token) in tokens.enumerated() {
                if case .operator(let op) = token, op == .add {
                    let left: Token? = (index - 1 >= 0) ? tokens[index - 1] : nil
                    let right: Token? = (index + 1 < tokens.count) ? tokens[index + 1] : nil

                    guard let rightToken = right else {
                        break
                    }

                    hasUnary = left == nil

                    if let leftOp = left, case .operator = leftOp {
                        hasUnary = true
                    }

                    if !hasUnary {
                        continue
                    }

                    if case .number = rightToken {
                        tokens.replaceSubrange(index...(index+1), with: [rightToken])
                        break
                    }
                }
            }
        } while hasUnary
    }

    private func processUnaryMinus() {
        var hasUnary = false

        repeat {
            hasUnary = false

            for (index, token) in tokens.enumerated() {
                if case .operator(let op) = token, op == .sub {
                    let left: Token? = (index - 1 >= 0) ? tokens[index - 1] : nil
                    let right: Token? = (index + 1 < tokens.count) ? tokens[index + 1] : nil

                    guard let rightToken = right else {
                        break
                    }

                    hasUnary = left == nil

                    if let leftOp = left, case .operator = leftOp {
                        hasUnary = true
                    }
                    
                    if !hasUnary {
                        continue
                    }

                    if case .number(let number) = rightToken {
                        let new = 0 - Int(number)!
                        let token = Token.number("\(new)")
                        tokens.replaceSubrange(index...(index+1), with: [token])
                        break
                    }
                }
            }
        } while hasUnary
    }

    private func processFromLeftToRight() {
        while tokens.count > 1 {
            var opIndex: Int?
            var oper: Operator?

            for (index, token) in tokens.enumerated() {
                if case .operator(let op) = token {
                    opIndex = index
                    oper = op
                    break
                }
            }

            if let index = opIndex, let op = oper {
                let left: Token? = (index - 1 >= 0) ? tokens[index - 1] : nil
                let right: Token? = (index + 1 < tokens.count) ? tokens[index + 1] : nil
                let result = op.solve(left: left, right: right)

                if case .error = result {
                    tokens = [result]
                    return
                }

                tokens.replaceSubrange((left == nil ? index : (index-1))...(right == nil ? index : (index+1)), with: [result])
            }
        }
    }

    private func tokenize(_ expression: String) {
        let decimalDigits = CharacterSet.decimalDigits
        var token: Token?

        func addDigit(_ digit: String) {
            if let t = token {
                if case .number(let prefix) = t {
                    token = .number(prefix + digit)
                } else {
                    tokens.append(t)
                    token = .number(digit)
                }
            } else {
                token = .number(digit)
            }
        }

        func addOperator(_ op: Operator) {
            if let t = token {
                tokens.append(t)
            }

            token = .operator(op)
        }

        for char in expression.characters {
            let string = String(char)

            if let scalar = UnicodeScalar(string), decimalDigits.contains(scalar) {
                addDigit(string)
            } else if let op = Operator(rawValue: string) {
                addOperator(op)
            }
        }

        if let token = token {
            tokens.append(token)
        }
    }
}
