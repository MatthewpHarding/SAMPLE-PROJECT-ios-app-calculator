//
//  ThemeManager.swift
//  Calc
//
//  Created by iOSB Free on 27/01/2022.
//
//
//  iOSB Free Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  π Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree//
//  Tell us what
//  you want to learn
//
//  π€ iOSB Free
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's a color theme manager, it stores all of our color themes.
//   Architectural Layer: Business Logic Layer
//
//   π‘ Architecture Tip ππ» We only want 1 instance of this class so we used a singleton.
// *******************************************************************************************


import Foundation

class ThemeManager {
    
    // MARK: - Properties
    
    private let dataStore = DataStoreManager(key: ThemeManager.keys.dataStore)
    
    // MARK: - ππ½ The Singleton Design Pattern
    
    static let shared = ThemeManager() // β π‘ Singletons: We use the singleton design pattern here because we want only 1 ThemeManager to exist
    
    // MARK: - Theme Options
    
    private(set) var themes: [CalculatorTheme] = []
    
    // MARK: - Accessing The Current Theme
    
    private var savedTheme: CalculatorTheme?
    var currentTheme: CalculatorTheme {
        guard let theme = savedTheme else {
            guard let firstThemeOption = themes.first else {
                return darkTheme
            }
            return firstThemeOption
        }
        
        return theme
    }
    
    // MARK: - Initialiser
    
    init() {
        restoreSavedTheme()
        populateSelectionOfThemes()
    }
    
    // MARK: - Populate Theme Selection
    
    private func populateSelectionOfThemes() {
        // NOTE: Apple rejected the app submission due to its similarity to the Apple calculator app
        themes = [appBrandTheme, purpleTheme, orangeTheme, pinkTheme, lightBlueTheme, electroTheme, washedOutTheme, bloodOrangeTheme, darkBlueTheme]
    }
    
    // MARK: - Save & Restore From Disk
    
    private func saveThemeToDisk(_ theme: CalculatorTheme) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(theme) {
            dataStore.set(encoded)
        }
    }
    
    private func restoreSavedTheme() {
        if let previousTheme = readSavedThemeFromDisk() {
            savedTheme = previousTheme
        }
    }
    
    private func readSavedThemeFromDisk() -> CalculatorTheme? {
        guard let savedTheme = dataStore.getValue() as? Data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        return try? decoder.decode(CalculatorTheme.self, from: savedTheme)
    }
    
    // MARK: - Changing Themes
    
    func moveToNextTheme() {
        let themeID = currentTheme.id
        let index = themes.firstIndex { calculatorTheme in
            calculatorTheme.id == themeID
        }
        
        // β The user is using a theme which has been removed. Reset to the first theme.
        guard let indexOfExistingTheme = index else {
            if let firstTheme = themes.first {
                updateSystemWithTheme(firstTheme)
            }
            return
        }
        
        // β Move to the next theme
        var nextThemeIndex = indexOfExistingTheme + 1
        if nextThemeIndex > themes.count - 1 {
            nextThemeIndex = 0
        }
        guard let nextTheme = themes[safe: nextThemeIndex] else {
            return
        }
        
        updateSystemWithTheme(nextTheme)
    }
    
    // MARK: - Set A New Theme
    
    private func updateSystemWithTheme(_ theme: CalculatorTheme) {
        savedTheme = theme
        saveThemeToDisk(theme)
    }
}
