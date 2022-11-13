//
//  LightCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
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
//  ♥️ iOSB Free
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
    
    var appBrandTheme: CalculatorTheme {
        CalculatorTheme(id:"3",
        background:             "#F6F8F9",
        display:                "#000000",
        operatorNormal:         "#4BE6A9",
        operatorSelected:       "#70729D",
        operatorTitle:          "#14145C",
        operatorTitleSelected:  "#ffffff",
        pinPad:                 "#E9F0F4",
        pinPad123:              "#D3E9F4",
        pinPadTitle:            "#000000",
        extraFunctions:         "#E9F0F4",
        extraFunctionsTitle:    "#4BE6A9",
        statusBarStyle: .dark)
    }
}
