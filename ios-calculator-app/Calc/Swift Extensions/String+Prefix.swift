//
//  String+Prefix.swift
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
