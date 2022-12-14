//
//  ZeroTests.swift
//  CalcTests
//
//  Created by iOSB Free on 27/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  π Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  β₯οΈ iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's our testing team! They are testing what happens when the user presses 0 on the pin pad.
//   Architectural Layer: Testing Layer
//
//   π‘ Career Tip ππ» Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class ZeroTests: XCTestCase {

    // MARK: - Operands - Left
    
    func test0_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test00_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test000_LeftHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    // MARK: - Operands - Right
    
    func test0_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test00_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test000_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test000Addition_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test000Subtraction_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.minusPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
    
    func test000Divide_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.dividePressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal.nan) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "Error")
    }
    
    func test000Multiply_RightHandEntry() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(0)
        calculatorEngine.multiplyPressed()
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.numberPressed(0)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.0)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0.0)) ?? false)
        XCTAssertTrue(calculatorEngine.lcdDisplayText == "0")
    }
}
