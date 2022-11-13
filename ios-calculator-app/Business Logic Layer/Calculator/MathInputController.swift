//
//  MathInputController.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
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
//  💚 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a manager for one equation. In charge of input and what is displayed to the user.
//   Architectural Layer: Business Logic Layer
//
//   💡 Architecture Tip 👉🏻 Try to restrict each file to one single purpose, which is known
//   as having a single responsibility. Why not google "single responsibility software"
// *******************************************************************************************


import Foundation

struct MathInputController {
    
    static let appBrandedStartController: MathInputController = {
        var inputController = MathInputController()
        inputController.allowRecordingToTheHistoryLog = false
        inputController.enterNumber(1)
        inputController.enterNumber(2)
        inputController.enterNumber(3)
        inputController.multiply()
        inputController.enterNumber(1)
        inputController.execute()
        return inputController
    }()
    
    // MARK: - Operation Side Enum
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    // MARK: - Constants
    
    private let decimalSymbol = Locale.current.decimalSeparator ?? "."
    private let groupingSymbol = Locale.current.groupingSeparator ?? ","
    private let minusSymbol = "-"
    private let errorMessage = "Error"
    
    // MARK: - variables
    
    private(set) var equation = MathEquation()
    private var editingSide: OperandSide = .leftHandSide
    private var isEnteringDecimal = false
    
    // MARK: - Display
    
    private(set) var lcdDisplayText = ""
    
    private func formatForLCDDisplay(_ decimal: Decimal?) -> String {
        guard decimal?.isNaN == false else { return errorMessage }
        return decimal?.formatted() ?? errorMessage
    }
    
    // MARK: - Record Equation In System
    
    var allowRecordingToTheHistoryLog = true 
    
    // MARK: - Initialiser
    
    init() {
        lcdDisplayText = formatForLCDDisplay(equation.lhs)
    }
    
    // MARK: - Completed Equation
    
    var isCompleted: Bool {
        return equation.executed
    }
    
    var isReadyToExecute: Bool {
        guard equation.executed == false else {
            return false
        }
        
        if let _ = operation,
           let _ = rhs {
            return true
        }
        
        return false
    }
    
    var containsNans: Bool {
        lhs.isNaN || (rhs?.isNaN ?? false) || (result?.isNaN ?? false)
    }
    
    // MARK: - Extra Functions
    
    mutating func negate() {
        guard isCompleted == false else { return }
        
        switch editingSide {
        case .leftHandSide:
            equation.negateLeftHandSide()
            displayNegateSymbolOnDisplay(lhs)
        case .rightHandSide:
            equation.negateRightHandSide()
            displayNegateSymbolOnDisplay(rhs)
        }
    }
    
    private mutating func displayNegateSymbolOnDisplay(_ decimal: Decimal?) {
        guard let decimal = decimal else { return }
        
        var isNegativeValue = false
        if decimal < 0 {
            isNegativeValue = true
        }
        
        if isNegativeValue {
            lcdDisplayText.addPrefixIfNeeded(minusSymbol)
        } else {
            lcdDisplayText.removePrefixIfNeeded(minusSymbol)
        }
    }
    
    mutating func applyPercentage() {
        guard isCompleted == false else { return }
        
        switch editingSide {
        case .leftHandSide:
            equation.applyPercentageToLeftHandSide()
            lcdDisplayText = formatForLCDDisplay(lhs)
        case .rightHandSide:
            guard let _ = rhs else { return }
            equation.applyPercentageToRightHandSide()
            lcdDisplayText = formatForLCDDisplay(rhs)
        }
    }

    mutating func applyDecimalPoint() {
        guard isCompleted == false else { return }
        isEnteringDecimal = true
        
        if editingSide == .rightHandSide,
           rhs == nil {
            rhs = Decimal(0)
        }
        
        lcdDisplayText = applyDecimalToStringIfNeeded(lcdDisplayText)
    }
    
    private func applyDecimalToStringIfNeeded(_ string: String) -> String {
        if string.contains(decimalSymbol) {
            return string
        }
        return string.appending(decimalSymbol)
    }
    
    // MARK: - Math Operations
    
    mutating func divide() {
        guard isCompleted == false else { return }
        operation = .divide
        startEditingRightHandSide()
    }
    
    mutating func add() {
        guard isCompleted == false else { return }
        operation = .add
        startEditingRightHandSide()
    }
    
    mutating func subtract() {
        guard isCompleted == false else { return }
        operation = .subtract
        startEditingRightHandSide()
    }
    
    mutating func multiply() {
        guard isCompleted == false else { return }
        operation = .multiply
        startEditingRightHandSide()
    }
    
    mutating func execute() {
        guard isCompleted == false else { return }
        equation.execute()
        lcdDisplayText = formatForLCDDisplay(equation.result)
    }
    
    mutating func enterNumber(_ number: Int) {
        guard isCompleted == false else { return }
        
        switch editingSide {
        case .leftHandSide:
            let tuple = appendNewNumber(number, toPreviousEntry: lhs)
            lhs = tuple.decimal
            lcdDisplayText = tuple.stringRepresentation
            
        case .rightHandSide:
            let tuple = appendNewNumber(number, toPreviousEntry:  rhs ?? Decimal.zero)
            rhs = tuple.decimal
            lcdDisplayText = tuple.stringRepresentation
        }
    }
    
    private func appendNewNumber(_ number: Int, toPreviousEntry previousInput: Decimal) -> (decimal: Decimal, stringRepresentation: String) {
        guard isEnteringDecimal == false else {
            return appendNewDecimal(number)
        }
        
        let stringInput = String(number)
        var newStringRepresentation = previousInput.isZero ? "" : lcdDisplayText
        newStringRepresentation.append(stringInput)
        
        let representationWithoutFormatting = newStringRepresentation.replacingOccurrences(of: groupingSymbol, with: "")
        
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: representationWithoutFormatting) as? NSDecimalNumber else { return (.nan, errorMessage) }
        
        let newDecimal = convertedNumber.decimalValue
        let newLCDDisplayText = formatForLCDDisplay(newDecimal)
        return (newDecimal, newLCDDisplayText)
    }
    
    private func appendNewDecimal(_ number: Int) -> (decimal: Decimal, stringRepresentation: String) {
        let stringInput = String(number)
        var newLCDDisplayText = applyDecimalToStringIfNeeded(lcdDisplayText)
        newLCDDisplayText.append(stringInput)
        
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newLCDDisplayText) else { return (.nan, errorMessage) }
        
        return (convertedNumber.decimalValue, newLCDDisplayText)
    }
    
    // MARK: - Copy & Paste
    
    mutating func pasteIn(_ decimal: Decimal) {
        switch editingSide {
            case .leftHandSide: lhs = decimal
            case .rightHandSide: rhs = decimal
        }
    }
    
    // MARK: - Print Description
    
    var generatePrintout: String {
        return equation.generatePrintout()
    }
    
    // MARK: - Set LHS & RHS Values
    
    var lhs: Decimal {
        get {
            return equation.lhs
        }
        set {
            equation.lhs = newValue
            lcdDisplayText = formatForLCDDisplay(newValue)
        }
    }
    
    var rhs: Decimal? {
        get {
            return equation.rhs
        }
        set {
            guard let decimal = newValue else {
                return
            }
            equation.rhs = decimal
            startEditingRightHandSide()
            lcdDisplayText = formatForLCDDisplay(decimal)
        }
    }
    
    var result: Decimal? {
        return equation.result
    }
    
    var operation: MathEquation.OperationType? {
        get {
            return equation.operation
        }
        set {
            guard let operation = newValue else {
                return
            }
            equation.operation = operation
            startEditingRightHandSide()
            isEnteringDecimal = false
        }
    }
    
    mutating func startEditingRightHandSide() {
        editingSide = .rightHandSide
    }
}
