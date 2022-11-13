//
//  OrangeCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
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
//  💛 iOSB Free
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
    
    var orangeTheme: CalculatorTheme {
        CalculatorTheme(id:"10",
        background:             "#DC6969",
        display:                "#ffffff",
        operatorNormal:         "#CC4D4D",
        operatorSelected:       "#AB2F2F",
        operatorTitle:          "#ffffff",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#C94848",
        pinPad123:              "#AB2F2F",
        pinPadTitle:            "#ffffff",
        extraFunctions:         "#D05353",
        extraFunctionsTitle:    "#ffffff",
        statusBarStyle: .light)
    }
}
