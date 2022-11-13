//
//  PinkCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
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
//  ❤️‍🩹 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   💡 Convenience Tip 👉🏻 We used extensions to seperate color data into files providing
//   designers with editable documents. Also allowing us to conveniently load the theme array.
// *******************************************************************************************


import Foundation

extension ThemeManager {
    
    var pinkTheme: CalculatorTheme {
        CalculatorTheme(id:"5",
        background:             "#253C5B",
        display:                "#EBF0EF",
        operatorNormal:         "#FA569C",
        operatorSelected:       "#0265FF",
        operatorTitle:          "#EBF0EF",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#16253A",
        pinPad123:              "#2E4866",
        pinPadTitle:            "#EBF0EF",
        extraFunctions:         "#294666",
        extraFunctionsTitle:    "#EBF0EF",
        statusBarStyle: .light)
    }
}
