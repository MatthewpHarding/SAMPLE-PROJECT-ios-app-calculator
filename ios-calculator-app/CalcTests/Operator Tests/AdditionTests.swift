//
//  AdditionTests.swift
//  CalcTests
//
//  Created by iOSB Free on 25/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΏ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  β€οΈ iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's our testing team! They are testing pressing the add button.
//   Architectural Layer: Testing Layer
//
//   π‘ Career Tip ππ» Writing unit tests prevents your work being rejected by the testing
//   department, which means we can become a dependable member of our team.
// *******************************************************************************************


import XCTest
@testable import Calc

class AdditionTests: XCTestCase {

    // MARK: - Basic
    
    func testBasicMath() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(1)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(1)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(1)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(2)) ?? false)
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
            calculatorEngine.addPressed()
            calculatorEngine.numberPressed(iteration)
            calculatorEngine.equalsPressed()
            
            XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(number)))
            XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(iteration)) ?? false)
            XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(number + iteration)) ?? false)
        }
        
    }
    
    // MARK: - Continuously Add From Result
    
    func testPinpad_ContinuouslyAdding() throws {
        continuouslyAdd(using: 1)
        continuouslyAdd(using: 2)
        continuouslyAdd(using: 3)
        continuouslyAdd(using: 4)
        continuouslyAdd(using: 5)
        continuouslyAdd(using: 6)
        continuouslyAdd(using: 7)
        continuouslyAdd(using: 8)
        continuouslyAdd(using: 9)
        continuouslyAdd(using: 0)
    }
    
    private func continuouslyAdd(using number: Int) {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(number)
        
        var currentResult = Decimal(number)
        for iteration in 0...9 {
            calculatorEngine.addPressed()
            calculatorEngine.numberPressed(iteration)
            calculatorEngine.equalsPressed()
            
            guard let result = calculatorEngine.resultOfEquation else {
                XCTAssert(true, "Did not have result after equation was expected to have completed")
                return
            }
            
            XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: currentResult))
            XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(iteration)) ?? false)
            XCTAssertTrue(result.isEqual(to: currentResult + Decimal(iteration)))
            
            currentResult = result
        }
    }
    
    // MARK: - Random Equation
    
    func testRandomEquation() throws {
        var calculatorEngine = iOSBFreeCalculatorEngine()
        calculatorEngine.numberPressed(7)
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(1)
        calculatorEngine.numberPressed(2)
        calculatorEngine.numberPressed(7)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()

        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(6)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(5)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(4)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(3)
        calculatorEngine.equalsPressed()
        
        calculatorEngine.addPressed()
        calculatorEngine.numberPressed(2)
        calculatorEngine.equalsPressed()
        
        XCTAssertTrue(calculatorEngine.leftHandOperand.isEqual(to: Decimal(186)))
        XCTAssertTrue(calculatorEngine.rightHandOperand?.isEqual(to: Decimal(2)) ?? false)
        XCTAssertTrue(calculatorEngine.resultOfEquation?.isEqual(to: Decimal(188)) ?? false)
    }
}
