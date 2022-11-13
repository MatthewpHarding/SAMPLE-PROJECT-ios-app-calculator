//
//  VibrantCalculatorTheme.swift
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
//  🖤 iOSB Free
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
    
    var bloodOrangeTheme: CalculatorTheme {
        CalculatorTheme(id:"9",
        background:             "#4A1D41",
        display:                "#ffffff",
        operatorNormal:         "#8D3362",
        operatorSelected:       "#AA0E67",
        operatorTitle:          "#ffffff",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#C64661",
        pinPad123:              "#CC5E79",
        pinPadTitle:            "#ffffff",
        extraFunctions:         "#9C3766",
        extraFunctionsTitle:    "#ffffff",
        statusBarStyle: .light)
    }
}
