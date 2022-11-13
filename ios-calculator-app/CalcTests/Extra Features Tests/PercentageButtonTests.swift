//
//  PercentageButtonTests.swift
//  CalcTests
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏾 Free Courses                 → https://www.udemy.com/user/iosbfree
//
//  YouTube                         → https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       → http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  💜 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's our testing team! They are testing pressing the percentage button.
//   Architectural Layer: Testing Layer
//
//   💡 Career Tip 👉🏻 Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class PercentageButtonTests: XCTestCase {

    // MARK: - operands - Left
    
    func testSmall_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.01)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.01")
    }
    
    func testLarge_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "1")
    }
    
    func test_LargeLeftHandEntry2() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(2)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "2")
    }

    func test_LeftHandEntryTwice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0001)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.0001")
    }
    
    func test_LeftHandEntryThrice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.000001)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.000001")
    }
    
    // MARK: - operands - Right
    
    func testSmall_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.01)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.01")
    }
    
    func testLarge_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(1)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "1")
    }
    
    func testLarge_RightHandEntry2() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(2)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "2")
    }

    func test_RightHandEntryTwice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0001)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.0001")
    }
    
    func test_RightHandEntryThrice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()

        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.000001)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.000001")
    }
    
    // MARK: - Result
    
    func testNegatingAResult() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.percentagePressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: 6))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "6")
        XCTAssertTrue(calculatorEngine.rightHandOperand == nil)
        XCTAssertTrue(calculatorEngine.resultOfEquation  == nil)
    }
    
    func testNegatingAResultTwice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
   
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: 0.06))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.06")
        XCTAssertTrue(calculatorEngine.rightHandOperand == nil)
        XCTAssertTrue(calculatorEngine.resultOfEquation  == nil)
    }
    
    func testNegatingAResultThrice() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
   
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()
        calculatorEngine.percentagePressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.formatted() == Decimal(0.0006).formatted())
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0.0006")
        XCTAssertTrue(calculatorEngine.rightHandOperand == nil)
        XCTAssertTrue(calculatorEngine.resultOfEquation  == nil)
    }
}
