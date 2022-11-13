//
//  Constants.swift
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
//  🧡 iOSB Free
//  community@iosbfree.com
//  🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
// *******************************************************************************************
//
// → What's This File?
//   It's a centralised area to store values. Here we can store a list of constant values
//   that we don't want to repeat or duplicate throughout our codebase.
//
// *******************************************************************************************

import Foundation
import UIKit

// MARK: - LCDDisplay

extension LCDDisplay {
    struct keys {
        static let pasteNumberNotification = "iOSBFree.com.calc.LCDDisplay.pasteNumber"
        static let pasteEquationNotification = "iOSBFree.com.calc.LCDDisplay.pasteMathEquation"
        static let userInfo = "valueToPaste"
        static let historyLogNotification = "iOSBFree.com.calc.LCDDisplay.displayHistory"
    }
}

// MARK: - UIStoryboard

extension UIStoryboard {
    struct keys {
        static let mainStoryboard = "Main"
        static let logViewController = "LogViewController"
    }
}

// MARK: - UIImage

extension UIImage {
    struct keys {
        static let circle = "Button Square Rounded"
        static let circleSliced = "Button Square Rounded-Sliced"
    }
}

// MARK: - ThemeManager

extension ThemeManager {
    struct keys {
        static let dataStore = "iOSBFree.com.calc.ThemeManager.theme"
    }
}

// MARK: - iOSBFreeCalculatorEngine

extension iOSBFreeCalculatorEngine {
    struct keys {
        static let dataStore = "iOSBFree.com.calc.CalculatorEngine.total"
    }
}
