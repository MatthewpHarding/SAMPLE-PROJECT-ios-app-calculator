//
//  CalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΏ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's data, to store color hex values in order to change the colors of the app.
//   Architectural Layer: Data Layer
//
//   π‘ Architecture Tip ππ» Storing colors as data files enabled us to create a theme feature.
// *******************************************************************************************


import Foundation

enum StatusBarStyle: String, Codable {
    case light = "light"   
    case dark = "dark"
}

struct CalculatorTheme: Codable {
    var id: String
    var background: String
    var display: String
    
    var operatorNormal: String
    var operatorSelected: String
    
    var operatorTitle: String
    var operatorTitleSelected: String
    
    var pinPad: String
    var pinPad123: String
    var pinPadTitle: String
    
    var extraFunctions: String
    var extraFunctionsTitle: String
    
    var statusBarStyle: StatusBarStyle
}
