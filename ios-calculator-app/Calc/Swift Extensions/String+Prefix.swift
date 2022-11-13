//
//  String+Prefix.swift
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
//   It's an extension for Swift Strings. We added a reusable function to add and remove
//   a prefix from a string
//
// *******************************************************************************************


import Foundation

extension String {
    
    mutating func addPrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) == false else { return }
        self = prefix + self
    }
    
    mutating func removePrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) == true else { return }
        self = replacingOccurrences(of: prefix, with: "", options: NSString.CompareOptions.literal, range: nil)
    }
}
