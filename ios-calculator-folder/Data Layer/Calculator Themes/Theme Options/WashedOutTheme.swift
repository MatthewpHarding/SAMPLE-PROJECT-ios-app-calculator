//
//  WashedOutCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
//
//
//  iOSB Free Ltd                   → All rights reserved
//  Website                         → https://www.iosbfree.com
//
//  👉🏽 Free Courses                 → https://www.udemy.com/user/iosbfree
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
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   💡 Team Tip 👉🏻 We can provide these files to a designer, if we wanted to.
// *******************************************************************************************


import Foundation

extension ThemeManager {
    
    var washedOutTheme: CalculatorTheme {
        CalculatorTheme(id:"8",
        background:             "#ECF5FF",
        display:                "#0D2A4B",
        operatorNormal:         "#A3CFF9",
        operatorSelected:       "#0D2A4B",
        operatorTitle:          "#5487BA",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#1D1D1D",
        pinPad123:              "#5487BA",
        pinPadTitle:            "#ffffff",
        extraFunctions:         "#A3CFF9",
        extraFunctionsTitle:    "#5487BA",
        statusBarStyle: .dark)
    }
}
