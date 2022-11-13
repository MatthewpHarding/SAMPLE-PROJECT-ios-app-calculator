//
//  PinPadTests.swift
//  CalcTests
//
//  Created by iOSB Free on 26/01/2022.
//
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏼 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  ♥️ iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's our testing team! They are testing pressesing all 9 numbers on the pin pad.
//   Architectural Layer: Testing Layer
//
//   💡 Career Tip 👉🏻 Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class PinPadTests: XCTestCase {

    // MARK: - Operands - Left
    
    func testSmall_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1)))
    }
    
    func testMedium_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(123)))
    }
    
    func testLarge_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        calculatorEngine.numberPressed(5)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(7)
        calculatorEngine.numberPressed(8)
        calculatorEngine.numberPressed(9)

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(123456789)))
    }
    
    
    
    // MARK: - Operands - Right
    
    func testSmall_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(1)) ?? false)
    }
    
    func testMedium_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.minusPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(1)

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(321)) ?? false)
    }
    
    func testLarge_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.dividePressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        calculatorEngine.numberPressed(5)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(7)
        calculatorEngine.numberPressed(8)
        calculatorEngine.numberPressed(9)

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(123456789)) ?? false)
    }
}
