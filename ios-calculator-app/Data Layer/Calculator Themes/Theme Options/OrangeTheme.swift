//
//  OrangeCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 26/01/2022.
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
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   π‘ Team Tip ππ» We can provide these files to a designer, if we wanted to.
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
