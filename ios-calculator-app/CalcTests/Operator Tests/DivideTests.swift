//
//  DivideTests.swift
//  CalcTests
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΎ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π§‘ iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's our testing team! They are testing pressing the divide button.
//   Architectural Layer: Testing Layer
//
//   π‘ Career Tip ππ» Writing unit tests prevents our work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class DivideTests: XCTestCase {

    // MARK: - Basic
    
    func testBasicMath() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.dividePressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(1)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(1)) ?? false)
    }

    // MARK: - Continuously Start New Equations
    
    func testPinpad() throws {
        continuouslyStartNewEquations(using: 1)
        continuouslyStartNewEquations(using: 2)
        continuouslyStartNewEquations(using: 3)
        continuouslyStartNewEquations(using: 4)
        continuouslyStartNewEquations(using: 5)
        continuouslyStartNewEquations(using: 6)
        continuouslyStartNewEquations(using: 7)
        continuouslyStartNewEquations(using: 8)
        continuouslyStartNewEquations(using: 9)
        continuouslyStartNewEquations(using: 0)
    }
    
    private func continuouslyStartNewEquations(using number: Int) {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        
        for iteration in 0...9 {
            calculatorEngine.numberPressed(number)
            calculatorEngine.dividePressed()
            calculatorEngine.numberPressed(iteration)
            calculatorEngine.equalsPressed()
            
            XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(number)))
            XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(iteration)) ?? false)
            XCTAssertTrue(calculatorEngine.resultOfEquation?.formatted() == (Decimal(number) / Decimal(iteration)).formatted())
            // π‘ Why compare strings? ππ» Comparing floating point numbers causes our tests to fail. They are not accurate enough to compare.
        }
        
    }
    
    // MARK: - Continuously Subtract From Result
    
    func testPinpad_ContinuouslyDividing() throws {
        continuouslyDivide(using: 1)
        continuouslyDivide(using: 2)
        continuouslyDivide(using: 3)
        continuouslyDivide(using: 4)
        continuouslyDivide(using: 5)
        continuouslyDivide(using: 6)
        continuouslyDivide(using: 7)
        continuouslyDivide(using: 8)
        continuouslyDivide(using: 9)
        continuouslyDivide(using: 0)
    }
    
    private func continuouslyDivide(using number: Int) {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(number)
        
        var currentResult: Decimal = Decimal(number)
        for iteration in 0...9 {
            calculatorEngine.dividePressed()
            calculatorEngine.numberPressed(iteration)
            calculatorEngine.equalsPressed()
            
            guard let result = calculatorEngine.resultOfEquation else {
                XCTAssert(true, "Did not have result after equation was expected to have completed")
                return
            }
            
            XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: currentResult))
            XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(iteration)) ?? false)
            XCTAssertTrue(result.isEqual(to: currentResult / Decimal(iteration)))
            
            currentResult = result
        }
    }
}
