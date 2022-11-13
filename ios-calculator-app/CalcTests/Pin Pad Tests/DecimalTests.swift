//
//  DecimalTests.swift
//  CalcTests
//
//  Created by iOSB Free on 27/01/2022.
//
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏻 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💙 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's our testing team! They are testing what happens when the user presses . on the pin pad.
//   Architectural Layer: Testing Layer
//
//   💡 Career Tip 👉🏻 Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class DecimalTests: XCTestCase {

    // MARK: - Operands - Left
    
    func testSmall_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
    }
    
    func testSmallWithZero_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
    }
    
    func testSmallWith1_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.1)))
    }
    
    func testMedium_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.1234)))
    }
    
    func testLarge_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        calculatorEngine.numberPressed(5)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(7)
        calculatorEngine.numberPressed(8)
        calculatorEngine.numberPressed(9)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.formatted() == Decimal(0.123456789).formatted())
    }
    
    // MARK: - Operands - Right
    
    func testSmall_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
    }
    
    func testSmallWithZero_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
    }
    
    func testSmallWith1_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.1)) ?? false)
    }
    
    func testMedium_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.1234)) ?? false)
    }
    
    func testLarge_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        calculatorEngine.numberPressed(5)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(7)
        calculatorEngine.numberPressed(8)
        calculatorEngine.numberPressed(9)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.formatted() ?? "" == Decimal(0.123456789).formatted())
    }
    
    
    // MARK: - Immediate Press Without Previous Value
    
    func testImmediatePress_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.formatted() == Decimal(0.1).formatted())
    }
    
    func testImmediatePress_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.formatted() ?? "" == Decimal(0.1).formatted())
    }
    
    // MARK: - Immediate Press Without Previous Value
    
    func testDecimalDisplay_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.decimalPressed()
        
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.")
    }
    
    func testResults_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.1)))
    }
    
    func testResults2_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.1)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.1)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.2)) ?? false)
    }
    
    func testResults3_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(4)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.1)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.1)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.2)) ?? false)
    }
    
    func testResults4_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(4)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1.04)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(1.44)) ?? false)
    }
    
    //MARK: - Decimal Math
    
    func testTwoDecimals() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(6)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.6)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(1)) ?? false)
    }
    
    func testTwoDecimals2() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(6)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.numberPressed(6)
        calculatorEngine.numberPressed(6)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.666)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.466)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(1.132)) ?? false)
    }
    
    func testTZeros() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.06)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.06)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.12)) ?? false)
    }
    
    func testTZeros2() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.006)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.006)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.012)) ?? false)
    }
    
    func testTZeros3() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        
        calculatorEngine.addPressed()
        
        calculatorEngine.numberPressed(0)
        calculatorEngine.decimalPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(6)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.formatted() == Decimal(0.0006).formatted())
        XCTAssertTrue(calculatorEngine.rightHandOperand?.formatted() == Decimal(0.0006).formatted())
        XCTAssertTrue(calculatorEngine.resultOfEquation?.formatted() == Decimal(0.0012).formatted())
    }
}
