//
//  EqualsButtonTests.swift
//  CalcTests
//
//  Created by iOSB Free on 26/01/2022.
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
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's our testing team! They are testing pressing the equals button.
//   Architectural Layer: Testing Layer
//
//   π‘ Career Tip ππ» Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class EqualsButtonTests: XCTestCase {
    
    // MARK: - Basic
    
    func testBasicMath() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.minusPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(1)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(0)) ?? false)
    }
    
    // MARK: - Continuously Pressing Equals From Result
    
    func testEquals_UsingAddition() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(4)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.equalsPressed()
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(12)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(16)) ?? false)
    }
    
    func testEquals_UsingSubtraction() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(4)
        calculatorEngine.minusPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()

        calculatorEngine.equalsPressed()
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(-4)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(-8)) ?? false)
    }
    
    func testEquals_UsingMultiplication() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(4)
        calculatorEngine.multiplyPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()

        calculatorEngine.equalsPressed()
        calculatorEngine.equalsPressed()
 
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(64)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(256)) ?? false)
    }
    
    func testEquals_UsingDivision() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(4)
        calculatorEngine.dividePressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.equalsPressed()
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(0.25)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(4)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.formatted() ==  Decimal(0.0625).formatted())
    }
}
