//
//  CalculatorColors.swift
//  Calc
//
//  Created by Matthew Paul Harding on 24/01/2022.
//

import Foundation

protocol ColorPalette {
    
    var background: String { get }
    var display: String { get }
    
    var operand: String { get }
    var operandSelected: String { get }
    
    var operatorTitle: String { get }
    var operatorTitleSelected: String { get }
    
    var pinPad: String { get }
    var pinPadTitle: String { get }
    
    var extraFunctions: String { get }
    var extraFunctionsTitle: String { get }
}
