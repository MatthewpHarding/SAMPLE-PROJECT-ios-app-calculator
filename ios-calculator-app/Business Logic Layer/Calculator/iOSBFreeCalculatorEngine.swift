//
//  iOSBFreeCalculatorEngine.swift
//  Calc
//
//  Created by iOSB Free on 25/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉 Free Courses                 → https://www.udemy.com/user/iosbfree
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
//   It's the core of the calculator. The brain. It generates all of our behaviour.
//   Architectural Layer: Business Logic Layer
//
//   💡 Testing Tip 👉🏻 By testing the API of iOSBFreeCalculatorEngine we save countless
//   hours worried about a live issue, which could have been prevented by writing unit tests.
// *******************************************************************************************


import Foundation

struct iOSBFreeCalculatorEngine {
    
    // MARK: - Variables
    
    private var historyLog: [MathEquation] = []
    private var mathInputController = MathInputController.appBrandedStartController
    
    // MARK: - Managers
    
    private let dataStore = DataStoreManager(key: iOSBFreeCalculatorEngine.keys.dataStore)
    
    // MARK: - Display
    
    var lcdDisplayText: String {
        mathInputController.lcdDisplayText
    }
    
    // MARK: - Properties For Testing
    
    var leftHandOperand: Decimal {
        mathInputController.lhs
    }
    
    var rightHandOperand: Decimal? {
        mathInputController.rhs
    }
    
    var resultOfEquation: Decimal? {
        mathInputController.result
    }
    
    // MARK: - Interaction API
    
    var copyOfEquationLog: [MathEquation] {
        historyLog
    }
    
    mutating func clearHistory() {
        historyLog = []
    }
    
    mutating func clearPressed() {
        mathInputController = MathInputController()
        deleteSavedSession()
    }
    
    mutating func negatePressed() {
        populatePreviousResultIfNeeded(true)
        mathInputController.negate()
    }
    
    mutating func percentagePressed() {
        populatePreviousResultIfNeeded(true)
        mathInputController.applyPercentage()
    }
    
    mutating func decimalPressed() {
        if mathInputController.isCompleted {
            mathInputController = MathInputController()
        }
        mathInputController.applyDecimalPoint()
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        commitAndPopulatePreviousResultIfNeeded()
        mathInputController.add()
    }
    
    mutating func minusPressed() {
        commitAndPopulatePreviousResultIfNeeded()
        mathInputController.subtract()
    }
    
    mutating func multiplyPressed() {
        commitAndPopulatePreviousResultIfNeeded()
        mathInputController.multiply()
    }
    
    mutating func dividePressed() {
        commitAndPopulatePreviousResultIfNeeded()
        mathInputController.divide()
    }
    
    mutating func equalsPressed() {
        if mathInputController.isCompleted {
            var newMathInput = MathInputController()
            newMathInput.lhs = mathInputController.result ?? Decimal.zero
            newMathInput.operation = mathInputController.operation
            newMathInput.rhs = mathInputController.rhs
            mathInputController = newMathInput
        }
        
        guard mathInputController.isReadyToExecute else {
            return
        }
        
        executeMathInputController()
    }
    
    // MARK: - Equation Execution
    
    private mutating func executeMathInputController() {
        mathInputController.execute()
        appendToHistoryLog(mathInputController)
        printEquationToDebugConsole(mathInputController)
        saveSession()
    }
    
    private mutating func appendToHistoryLog(_ inputController: MathInputController) {
        guard inputController.allowRecordingToTheHistoryLog else { return }
        historyLog.append(inputController.equation)
    }
    
    // MARK: - Print To Console
    
    private func printEquationToDebugConsole(_ mathInputController: MathInputController) {
        // → Using the print command only works in debug mode
        print(mathInputController.generatePrintout)
    }
    
    // MARK: - Number Input
    
    mutating func numberPressed(_ number: Int) {
        // → Only accept values from the numeric keypad -9..9
        guard number <= 9,
        number >= -9 else { return }
        
        if mathInputController.isCompleted {
            mathInputController = MathInputController()
        }
        mathInputController.enterNumber(number)
    }
    
    // MARK: - Business Logic & Behaviour
    
    private mutating func commitCurrentEquationIfNeeded() -> Bool {
        if mathInputController.isCompleted == false,
           mathInputController.isReadyToExecute {
            executeMathInputController()
            return true
        }
        
        return false
    }
    
    private mutating func populateMathInputControllerWithPreviousResult(_ continueEditingResult: Bool = false) {
        var newMathInput = MathInputController()
        newMathInput.lhs = mathInputController.result ?? Decimal(0)
        
        if continueEditingResult == false {
            newMathInput.startEditingRightHandSide()
        }
        mathInputController = newMathInput
    }
    
    private mutating func commitAndPopulatePreviousResultIfNeeded(_ continueEditingResult: Bool = false) {
        
        // → Scenario 1: user enters 5 * 5 *
        if commitCurrentEquationIfNeeded() {
            populateMathInputControllerWithPreviousResult(continueEditingResult)
        }
        
        // → secanrio 2: user enters 5 * 5 = *
        if mathInputController.isCompleted {
            populateMathInputControllerWithPreviousResult()
        }
    }
    
    private mutating func populatePreviousResultIfNeeded(_ continueEditingResult: Bool = false) {
        if mathInputController.isCompleted {
            populateMathInputControllerWithPreviousResult(continueEditingResult)
        }
    }
    
    // MARK: - Restoring Session
    
    mutating func restoreFromLastSession() -> Bool {
        guard
            let lastExecutedEquation = readSavedEquationFromDisk(),
            let lastExecutedResult = lastExecutedEquation.result
            else {
            return false
        }
        
        var newMathInput = MathInputController()
        newMathInput.lhs = Decimal(1)
        newMathInput.multiply()
        newMathInput.rhs = lastExecutedResult
        newMathInput.execute()
        mathInputController = newMathInput
        return true
    }
    
    private func saveSession() {
        guard mathInputController.allowRecordingToTheHistoryLog else { return }
        
        guard
            isMathInputSafeToBeSaved(mathInputController) == true,
            mathInputController.result?.isEqual(to: .zero) == false
        else {
            return
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(mathInputController.equation) {
            dataStore.set(encoded)
        }
    }
    
    private func deleteSavedSession() {
        dataStore.deleteValue()
    }
    
    private func isMathInputSafeToBeSaved(_ mathInput: MathInputController) -> Bool {
        guard mathInput.containsNans == false,  // → crashes when encoding nans
              let _ = mathInput.result,
              mathInput.isCompleted
        else {
            return false
        }
        return true
    }
    
    private func readSavedEquationFromDisk() -> MathEquation? {
        guard let savedEquation = dataStore.getValue() as? Data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        return try? decoder.decode(MathEquation.self, from: savedEquation)
    }
    
    // MARK: - Copy & Paste
    
    // → 💡 Just a thought: Adding system features like copy & paste provides a nicer experience for the user.
    
    mutating func pasteInNumber(from decimal: Decimal) {
        if mathInputController.isCompleted {
            mathInputController = MathInputController()
        }
        
        mathInputController.pasteIn(decimal)
    }
    
    mutating func pasteInNumber(from mathEquation: MathEquation) {
        guard let result = mathEquation.result else {
            return
        }
        
        mathInputController = MathInputController()
        pasteInNumber(from: result)
    }
}
