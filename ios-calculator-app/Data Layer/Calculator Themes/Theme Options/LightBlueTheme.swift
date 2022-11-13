//
//  LightBlueCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
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
//  ❤️ iOSB Free
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
    
    var lightBlueTheme: CalculatorTheme {
        CalculatorTheme(id:"4",
        background:             "#F8F8F8",
        display:                "#000000",
        operatorNormal:         "#00B4FF",
        operatorSelected:       "#0265FF",
        operatorTitle:          "#ffffff",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#EEEEEE",
        pinPad123:              "#D9F3F9",
        pinPadTitle:            "#000000",
        extraFunctions:         "#EAF7F9",
        extraFunctionsTitle:    "#00B4FF",
        statusBarStyle: .dark)
    }
}
