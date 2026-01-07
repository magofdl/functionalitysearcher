//
//  AppTheme.swift
//  FunctionalitySearcher
//
//  Design System - Theme Management
//

import SwiftUI

// MARK: - Theme Protocol

protocol Theme {
    var name: String { get }
    var colorPalette: ColorPalette { get }
    var typography: Typography { get }
    var spacing: Spacing { get }
    var cornerRadius: CornerRadius { get }
}

// MARK: - Theme Types

enum ThemeType: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case blue = "Blue Ocean"
    case purple = "Purple Dream"
    case green = "Nature"
    
    var id: String { rawValue }
    
    var theme: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        case .blue:
            return BlueTheme()
        case .purple:
            return PurpleTheme()
        case .green:
            return GreenTheme()
        }
    }
}

// MARK: - Color Palette

struct ColorPalette {
    // Primary Colors
    let primary: Color
    let primaryVariant: Color
    let onPrimary: Color
    
    // Secondary Colors
    let secondary: Color
    let secondaryVariant: Color
    let onSecondary: Color
    
    // Background Colors
    let background: Color
    let surface: Color
    let onBackground: Color
    let onSurface: Color
    
    // Utility Colors
    let error: Color
    let success: Color
    let warning: Color
    let info: Color
    
    // Text Colors
    let textPrimary: Color
    let textSecondary: Color
    let textTertiary: Color
    let textDisabled: Color
    
    // Border & Divider
    let border: Color
    let divider: Color
}

// MARK: - Typography

struct Typography {
    let headline: Font
    let title: Font
    let subtitle1: Font
    let subtitle2: Font
    let body: Font
    let caption: Font
    let button: Font
}

// MARK: - Spacing

struct Spacing {
    let xs: CGFloat = 4
    let sm: CGFloat = 8
    let md: CGFloat = 16
    let lg: CGFloat = 24
    let xl: CGFloat = 32
    let xxl: CGFloat = 48
}

// MARK: - Corner Radius

struct CornerRadius {
    let small: CGFloat = 4
    let medium: CGFloat = 8
    let large: CGFloat = 12
    let extraLarge: CGFloat = 16
    let round: CGFloat = 999
}

// MARK: - Light Theme

struct LightTheme: Theme {
    let name = "Light"
    
    let colorPalette = ColorPalette(
        primary: Color(red: 0.0, green: 0.48, blue: 1.0),      // Bright Blue
        primaryVariant: Color(red: 0.0, green: 0.38, blue: 0.9),
        onPrimary: Color.white,
        secondary: Color(red: 1.0, green: 0.58, blue: 0.0),    // Bright Orange
        secondaryVariant: Color(red: 0.9, green: 0.48, blue: 0.0),
        onSecondary: Color.white,
        background: Color(red: 0.98, green: 0.98, blue: 0.98), // Very Light Gray
        surface: Color.white,                                   // Pure White
        onBackground: Color(red: 0.1, green: 0.1, blue: 0.1),
        onSurface: Color(red: 0.1, green: 0.1, blue: 0.1),
        error: Color(red: 0.9, green: 0.2, blue: 0.2),
        success: Color(red: 0.2, green: 0.7, blue: 0.3),
        warning: Color(red: 1.0, green: 0.6, blue: 0.0),
        info: Color(red: 0.0, green: 0.48, blue: 1.0),
        textPrimary: Color(red: 0.1, green: 0.1, blue: 0.1),   // Almost Black
        textSecondary: Color(red: 0.4, green: 0.4, blue: 0.4), // Medium Gray
        textTertiary: Color(red: 0.6, green: 0.6, blue: 0.6),  // Light Gray
        textDisabled: Color(red: 0.75, green: 0.75, blue: 0.75),
        border: Color(red: 0.85, green: 0.85, blue: 0.85),
        divider: Color(red: 0.9, green: 0.9, blue: 0.9)
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold, design: .default),
        title: .system(size: 22, weight: .semibold, design: .default),
        subtitle1: .system(size: 18, weight: .medium, design: .default),
        subtitle2: .system(size: 16, weight: .medium, design: .default),
        body: .system(size: 15, weight: .regular, design: .default),
        caption: .system(size: 13, weight: .regular, design: .default),
        button: .system(size: 16, weight: .semibold, design: .default)
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}

// MARK: - Dark Theme

struct DarkTheme: Theme {
    let name = "Dark"
    
    let colorPalette = ColorPalette(
        primary: Color(red: 0.4, green: 0.78, blue: 1.0),      // Bright Light Blue
        primaryVariant: Color(red: 0.3, green: 0.68, blue: 0.95),
        onPrimary: Color(red: 0.05, green: 0.05, blue: 0.1),   // Very Dark Blue
        secondary: Color(red: 1.0, green: 0.76, blue: 0.35),   // Bright Orange
        secondaryVariant: Color(red: 0.95, green: 0.66, blue: 0.25),
        onSecondary: Color(red: 0.1, green: 0.05, blue: 0.0),  // Dark Brown
        background: Color(red: 0.09, green: 0.09, blue: 0.11), // Very Dark (casi negro)
        surface: Color(red: 0.15, green: 0.15, blue: 0.18),    // Dark Gray (más contraste)
        onBackground: Color.white,                              // Blanco puro
        onSurface: Color.white,                                 // Blanco puro
        error: Color(red: 1.0, green: 0.35, blue: 0.35),
        success: Color(red: 0.35, green: 0.95, blue: 0.5),
        warning: Color(red: 1.0, green: 0.76, blue: 0.35),
        info: Color(red: 0.4, green: 0.78, blue: 1.0),
        textPrimary: Color(red: 1.0, green: 1.0, blue: 1.0),      // Blanco puro
        textSecondary: Color(red: 0.78, green: 0.78, blue: 0.78), // Gris claro brillante
        textTertiary: Color(red: 0.58, green: 0.58, blue: 0.62),  // Gris medio brillante
        textDisabled: Color(red: 0.4, green: 0.4, blue: 0.44),
        border: Color(red: 0.3, green: 0.3, blue: 0.35),          // Más visible
        divider: Color(red: 0.25, green: 0.25, blue: 0.3)
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold, design: .default),
        title: .system(size: 22, weight: .semibold, design: .default),
        subtitle1: .system(size: 18, weight: .medium, design: .default),
        subtitle2: .system(size: 16, weight: .medium, design: .default),
        body: .system(size: 15, weight: .regular, design: .default),
        caption: .system(size: 13, weight: .regular, design: .default),
        button: .system(size: 16, weight: .semibold, design: .default)
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}

// MARK: - Blue Theme

struct BlueTheme: Theme {
    let name = "Blue Ocean"
    
    let colorPalette = ColorPalette(
        primary: Color(red: 0.0, green: 0.48, blue: 0.8),
        primaryVariant: Color(red: 0.0, green: 0.38, blue: 0.7),
        onPrimary: Color.white,
        secondary: Color(red: 0.0, green: 0.74, blue: 0.83),
        secondaryVariant: Color(red: 0.0, green: 0.64, blue: 0.73),
        onSecondary: Color.white,
        background: Color(red: 0.95, green: 0.97, blue: 1.0),
        surface: Color.white,
        onBackground: Color(red: 0.1, green: 0.1, blue: 0.2),
        onSurface: Color(red: 0.1, green: 0.1, blue: 0.2),
        error: Color(red: 0.9, green: 0.2, blue: 0.2),
        success: Color(red: 0.0, green: 0.7, blue: 0.5),
        warning: Color(red: 1.0, green: 0.6, blue: 0.0),
        info: Color(red: 0.0, green: 0.48, blue: 0.8),
        textPrimary: Color(red: 0.1, green: 0.1, blue: 0.2),
        textSecondary: Color(red: 0.3, green: 0.3, blue: 0.4),
        textTertiary: Color(red: 0.5, green: 0.5, blue: 0.6),
        textDisabled: Color(red: 0.7, green: 0.7, blue: 0.75),
        border: Color(red: 0.85, green: 0.87, blue: 0.9),
        divider: Color(red: 0.9, green: 0.92, blue: 0.95)
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold, design: .rounded),
        title: .system(size: 22, weight: .semibold, design: .rounded),
        subtitle1: .system(size: 18, weight: .medium, design: .rounded),
        subtitle2: .system(size: 16, weight: .medium, design: .rounded),
        body: .system(size: 15, weight: .regular, design: .rounded),
        caption: .system(size: 13, weight: .regular, design: .rounded),
        button: .system(size: 16, weight: .semibold, design: .rounded)
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}

// MARK: - Purple Theme

struct PurpleTheme: Theme {
    let name = "Purple Dream"
    
    let colorPalette = ColorPalette(
        primary: Color(red: 0.6, green: 0.2, blue: 0.8),
        primaryVariant: Color(red: 0.5, green: 0.1, blue: 0.7),
        onPrimary: Color.white,
        secondary: Color(red: 0.9, green: 0.3, blue: 0.6),
        secondaryVariant: Color(red: 0.8, green: 0.2, blue: 0.5),
        onSecondary: Color.white,
        background: Color(red: 0.98, green: 0.95, blue: 1.0),
        surface: Color.white,
        onBackground: Color(red: 0.2, green: 0.1, blue: 0.3),
        onSurface: Color(red: 0.2, green: 0.1, blue: 0.3),
        error: Color(red: 0.9, green: 0.2, blue: 0.3),
        success: Color(red: 0.5, green: 0.7, blue: 0.3),
        warning: Color(red: 1.0, green: 0.6, blue: 0.2),
        info: Color(red: 0.6, green: 0.2, blue: 0.8),
        textPrimary: Color(red: 0.2, green: 0.1, blue: 0.3),
        textSecondary: Color(red: 0.4, green: 0.3, blue: 0.5),
        textTertiary: Color(red: 0.6, green: 0.5, blue: 0.7),
        textDisabled: Color(red: 0.75, green: 0.7, blue: 0.8),
        border: Color(red: 0.9, green: 0.85, blue: 0.95),
        divider: Color(red: 0.95, green: 0.9, blue: 0.98)
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold, design: .default),
        title: .system(size: 22, weight: .semibold, design: .default),
        subtitle1: .system(size: 18, weight: .medium, design: .default),
        subtitle2: .system(size: 16, weight: .medium, design: .default),
        body: .system(size: 15, weight: .regular, design: .default),
        caption: .system(size: 13, weight: .regular, design: .default),
        button: .system(size: 16, weight: .semibold, design: .default)
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}

// MARK: - Green Theme

struct GreenTheme: Theme {
    let name = "Nature"
    
    let colorPalette = ColorPalette(
        primary: Color(red: 0.2, green: 0.7, blue: 0.4),
        primaryVariant: Color(red: 0.1, green: 0.6, blue: 0.3),
        onPrimary: Color.white,
        secondary: Color(red: 0.5, green: 0.8, blue: 0.3),
        secondaryVariant: Color(red: 0.4, green: 0.7, blue: 0.2),
        onSecondary: Color.white,
        background: Color(red: 0.95, green: 0.98, blue: 0.95),
        surface: Color.white,
        onBackground: Color(red: 0.1, green: 0.2, blue: 0.1),
        onSurface: Color(red: 0.1, green: 0.2, blue: 0.1),
        error: Color(red: 0.9, green: 0.3, blue: 0.2),
        success: Color(red: 0.2, green: 0.7, blue: 0.4),
        warning: Color(red: 1.0, green: 0.7, blue: 0.0),
        info: Color(red: 0.2, green: 0.6, blue: 0.8),
        textPrimary: Color(red: 0.1, green: 0.2, blue: 0.1),
        textSecondary: Color(red: 0.3, green: 0.4, blue: 0.3),
        textTertiary: Color(red: 0.5, green: 0.6, blue: 0.5),
        textDisabled: Color(red: 0.7, green: 0.75, blue: 0.7),
        border: Color(red: 0.85, green: 0.9, blue: 0.85),
        divider: Color(red: 0.9, green: 0.95, blue: 0.9)
    )
    
    let typography = Typography(
        headline: .system(size: 28, weight: .bold, design: .rounded),
        title: .system(size: 22, weight: .semibold, design: .rounded),
        subtitle1: .system(size: 18, weight: .medium, design: .rounded),
        subtitle2: .system(size: 16, weight: .medium, design: .rounded),
        body: .system(size: 15, weight: .regular, design: .rounded),
        caption: .system(size: 13, weight: .regular, design: .rounded),
        button: .system(size: 16, weight: .semibold, design: .rounded)
    )
    
    let spacing = Spacing()
    let cornerRadius = CornerRadius()
}
