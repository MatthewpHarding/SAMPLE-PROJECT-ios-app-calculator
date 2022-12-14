//
//  Constants.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΌ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π§‘ iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
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
