//
//  CalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏿 Free Courses                 → https://www.udemy.com/user/iosbfree
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
//   It's data, to store color hex values in order to change the colors of the app.
//   Architectural Layer: Data Layer
//
//   💡 Architecture Tip 👉🏻 Storing colors as data files enabled us to create a theme feature.
// *******************************************************************************************


import Foundation

enum StatusBarStyle: String, Codable {
    case light = "light"   
    case dark = "dark"
}

struct CalculatorTheme: Codable {
    var id: String
    var background: String
    var display: String
    
    var operatorNormal: String
    var operatorSelected: String
    
    var operatorTitle: String
    var operatorTitleSelected: String
    
    var pinPad: String
    var pinPad123: String
    var pinPadTitle: String
    
    var extraFunctions: String
    var extraFunctionsTitle: String
    
    var statusBarStyle: StatusBarStyle
}
