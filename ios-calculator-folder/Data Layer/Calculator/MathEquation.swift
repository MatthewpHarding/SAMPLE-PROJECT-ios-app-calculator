//
//  MathEquation.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
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
//  💛 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's data that represents one equation. It also performs a little math too.
//   Architectural Layer: Data Layer
//
//   💡 Architecture Tip 👉🏿  "S.O.L.I.D" is an acronym for some solid engineering principles
//   that every developer should memorise and commit to memory. 👍🏼 
// *******************************************************************************************


import Foundation

struct MathEquation: Codable {
    
    // MARK: - Operation Enum
    
    enum OperationType: String, Codable {
        case add = "add"
        case subtract = "subtract"
        case divide = "divide"
        case multiply  = "multiply"
    }
    
    // MARK: - Variables
    
    var lhs: Decimal = 0
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    var executed: Bool {
        return result != nil
    }
    
    // MARK: - Equation Math
    
    mutating func execute() {
        guard let rightHandSide = rhs else { return }
        
        switch operation {
        case .multiply:
        result = lhs * rightHandSide
        case .subtract:
            result = lhs - rightHandSide
        case .add:
            result = lhs + rightHandSide
        case .divide:
            result = lhs / rightHandSide
        case .none:
            break
        }
    }
    
    mutating func negateLeftHandSide() {
        lhs.negate()
    }
    
    mutating func negateRightHandSide() {
        rhs?.negate()
    }
    
    mutating func applyPercentageToLeftHandSide() {
        lhs = calculatePercentageValue(lhs)
    }
    
    mutating func applyPercentageToRightHandSide() {
        rhs = calculatePercentageValue(rhs)
    }

    private func calculatePercentageValue(_ decimal: Decimal?) -> Decimal {
        guard let decimal = decimal else { return .nan }
        return  decimal / 100
    }
    
    // MARK: - Visual Representations
    
    func generatePrintout() -> String {
        let operatorString = generateStringRepresentationOfOperator()
        return lhs.formatted() + " " + operatorString + " " + (rhs?.formatted() ?? "") + " = " + (result?.formatted() ?? "")
    }
    
    func generateStringRepresentationOfOperator() -> String {
        switch operation {
        case .multiply: return "*"
        case .divide: return "/"
        case .add: return "+"
        case .subtract: return "-"
        case .none:
            return ""
        }
    }
}
