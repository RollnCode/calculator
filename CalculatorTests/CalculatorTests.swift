//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Vitalii Yevtushenko on 11/30/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    let calc = Calculator()

    // No calculations

    func test_equal_01() {
        XCTAssertEqual(calc.solve("1"), "1")
    }

    // Integer addition

    func test_add_01() {
        XCTAssertEqual(calc.solve("1+1"), "2")
    }

    func test_add_02() {
        XCTAssertEqual(calc.solve("128+256"), "384")
    }

    func test_add_03() {
        XCTAssertEqual(calc.solve("1+2+3+4"), "10")
    }

    func test_add_04() {
        XCTAssertEqual(calc.solve("1 + 1"), "2")
    }

    func test_add_05() {
        XCTAssertEqual(calc.solve("+ 1"), "1")
    }

    func test_add_06() {
        XCTAssertEqual(calc.solve("+1"), "1")
    }

    func test_add_07() {
        XCTAssertEqual(calc.solve("1+"), "Error")
    }

    func test_add_08() {
        XCTAssertEqual(calc.solve("++15"), "15")
    }

    func test_add_09() {
        XCTAssertEqual(calc.solve("+++255"), "255")
    }

    // Integer substraction

    func test_sub_01() {
        XCTAssertEqual(calc.solve("1-1"), "0")
    }

    func test_sub_02() {
        XCTAssertEqual(calc.solve("128-256"), "-128")
    }

    func test_sub_03() {
        XCTAssertEqual(calc.solve("10-2-5"), "3")
    }

    func test_sub_04() {
        XCTAssertEqual(calc.solve("7 - 3"), "4")
    }

    func test_sub_05() {
        XCTAssertEqual(calc.solve("- 1"), "-1")
    }

    func test_sub_06() {
        XCTAssertEqual(calc.solve("-1"), "-1")
    }

    func test_sub_07() {
        XCTAssertEqual(calc.solve("1-"), "Error")
    }

    // Integer addition and substraction

    func test_addsub_01() {
        XCTAssertEqual(calc.solve("1+2-3+4"), "4")
    }

    func test_addsub_02() {
        XCTAssertEqual(calc.solve("-1+2-3+4"), "2")
    }

    func test_addsub_03() {
        XCTAssertEqual(calc.solve("-100 + 200 - 300 + 400"), "200")
    }

    func test_addsub_04() {
        XCTAssertEqual(calc.solve("-100 + 200 - 300 + 400 - 777"), "-577")
    }

    func test_addsub_05() {
        XCTAssertEqual(calc.solve("--100"), "100")
    }

    func test_addsub_06() {
        XCTAssertEqual(calc.solve("-----100"), "-100")
    }

    func test_addsub_07() {
        XCTAssertEqual(calc.solve("+-100"), "-100")
    }

    // Integer multiplication

    func test_mul_01() {
        XCTAssertEqual(calc.solve("1*1"), "1")
    }

    func test_mul_02() {
        XCTAssertEqual(calc.solve("128*256"), "32768")
    }

    func test_mul_03() {
        XCTAssertEqual(calc.solve("10*2*5"), "100")
    }

    func test_mul_04() {
        XCTAssertEqual(calc.solve("7 * 3"), "21")
    }

    func test_mul_05() {
        XCTAssertEqual(calc.solve("*1"), "Error")
    }

    func test_mul_06() {
        XCTAssertEqual(calc.solve("1*"), "Error")
    }

    func test_mul_07() {
        XCTAssertEqual(calc.solve("-2 * 5"), "-10")
    }

    func test_mul_08() {
        XCTAssertEqual(calc.solve("-2 * -5"), "10")
    }

    func test_mul_09() {
        XCTAssertEqual(calc.solve("2 * -5"), "-10")
    }

    func test_mul_10() {
        XCTAssertEqual(calc.solve("2 * +5"), "10")
    }

    func test_mul_11() {
        XCTAssertEqual(calc.solve("+2 * +5"), "10")
    }

    func test_mul_12() {
        XCTAssertEqual(calc.solve("+2 * 5"), "10")
    }

    func test_mul_13() {
        XCTAssertEqual(calc.solve("+2 * -5"), "-10")
    }

    func test_mul_14() {
        XCTAssertEqual(calc.solve("-2 * +5"), "-10")
    }

    func test_mul_15() {
        XCTAssertEqual(calc.solve("2 + 2 * 2"), "6")
    }

    // Integer division

    func test_div_01() {
        XCTAssertEqual(calc.solve("2/2"), "1")
    }

    func test_div_02() {
        XCTAssertEqual(calc.solve("256/128"), "2")
    }

    func test_div_03() {
        XCTAssertEqual(calc.solve("10/2/5"), "1")
    }

    func test_div_04() {
        XCTAssertEqual(calc.solve("30 / 3"), "10")
    }

    func test_div_05() {
        XCTAssertEqual(calc.solve("/1"), "Error")
    }

    func test_div_06() {
        XCTAssertEqual(calc.solve("1/"), "Error")
    }

    func test_div_07() {
        XCTAssertEqual(calc.solve("-20 / 5"), "-4")
    }

    func test_div_08() {
        XCTAssertEqual(calc.solve("-20 / -5"), "4")
    }

    func test_div_09() {
        XCTAssertEqual(calc.solve("20 / -5"), "-4")
    }

    func test_div_10() {
        XCTAssertEqual(calc.solve("20 / +5"), "4")
    }

    func test_div_11() {
        XCTAssertEqual(calc.solve("+20 / +5"), "4")
    }

    func test_div_12() {
        XCTAssertEqual(calc.solve("+20 / 5"), "4")
    }

    func test_div_13() {
        XCTAssertEqual(calc.solve("+20 / -5"), "-4")
    }

    func test_div_14() {
        XCTAssertEqual(calc.solve("-20 / +5"), "-4")
    }

    func test_div_15() {
        XCTAssertEqual(calc.solve("2 + 2 / 2"), "3")
    }

    func test_div_16() {
        XCTAssertEqual(calc.solve("2 + 2 / 2 + 2 * 2"), "7")
    }
}
