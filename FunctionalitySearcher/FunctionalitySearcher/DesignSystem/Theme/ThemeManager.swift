//
//  ThemeManager.swift
//  FunctionalitySearcher
//
//  Design System - Theme Manager (Observable)
//

import SwiftUI

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    @Published var currentThemeType: ThemeType {
        didSet {
            UserDefaults.standard.set(currentThemeType.rawValue, forKey: "selectedTheme")
        }
    }
    
    var currentTheme: Theme {
        currentThemeType.theme
    }
    
    private init() {
        // Load saved theme or default to light
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let themeType = ThemeType(rawValue: savedTheme) {
            self.currentThemeType = themeType
        } else {
            self.currentThemeType = .light
        }
    }
    
    func setTheme(_ themeType: ThemeType) {
        withAnimation(.easeInOut(duration: 0.3)) {
            currentThemeType = themeType
        }
    }
}

// MARK: - View Extension for Theme Access

extension View {
    func themedApp() -> some View {
        self.modifier(ThemedAppModifier())
    }
}

// MARK: - Themed App Modifier

struct ThemedAppModifier: ViewModifier {
    @StateObject private var themeManager = ThemeManager.shared
    
    func body(content: Content) -> some View {
        content
            .environmentObject(themeManager)
            .onChange(of: themeManager.currentThemeType) { _ in
                // Force view update when theme changes
            }
    }
}
