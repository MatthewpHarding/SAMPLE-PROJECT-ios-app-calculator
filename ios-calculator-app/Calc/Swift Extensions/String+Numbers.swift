//
//  String+Numbers.swift
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
//   It's an extension for Swift Strings. We added a computed property to produce the numeric
//   equivalent if it exists.
//
// *******************************************************************************************


import Foundation

extension String {
    
    var doubleValue: Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)?.doubleValue
    }
}
