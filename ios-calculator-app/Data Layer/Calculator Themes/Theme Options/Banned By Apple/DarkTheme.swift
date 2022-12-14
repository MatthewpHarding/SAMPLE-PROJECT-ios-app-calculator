//
//  DarkCalculatorTheme.swift
//  Calc
//
//  Created by iOSB Free on 24/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΎ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   π‘ Convenience Tip ππ» We used extensions to seperate color data into files providing
//   designers with editable documents. Also allowing us to conveniently load the theme array.
// *******************************************************************************************


import Foundation

extension ThemeManager {
    
    var darkTheme: CalculatorTheme {
        CalculatorTheme(id:"1",
        background:             "#000000",
        display:                "#ffffff",
        operatorNormal:         "#ff9f0a",
        operatorSelected:       "#ffffff",
        operatorTitle:          "#ffffff",
        operatorTitleSelected:  "#ff9f0a",
        pinPad:                 "#333333",
        pinPad123:              "#333333",
        pinPadTitle:            "#ffffff",
        extraFunctions:         "#a6a6a6",
        extraFunctionsTitle:    "#000000",
        statusBarStyle: .light)
    }
}
