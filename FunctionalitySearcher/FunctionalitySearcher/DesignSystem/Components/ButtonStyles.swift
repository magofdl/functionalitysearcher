//
//  ButtonStyles.swift
//  FunctionalitySearcher
//
//  Design System - Button Styles
//

import SwiftUI

// MARK: - Primary Button Style

struct PrimaryButtonStyle: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(theme.typography.button)
            .foregroundColor(theme.colorPalette.onPrimary)
            .padding(.horizontal, theme.spacing.md)
            .padding(.vertical, theme.spacing.sm)
            .background(
                RoundedRectangle(cornerRadius: theme.cornerRadius.medium)
                    .fill(isEnabled ? theme.colorPalette.primary : theme.colorPalette.textDisabled)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Secondary Button Style

struct SecondaryButtonStyle: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(theme.typography.button)
            .foregroundColor(isEnabled ? theme.colorPalette.primary : theme.colorPalette.textDisabled)
            .padding(.horizontal, theme.spacing.md)
            .padding(.vertical, theme.spacing.sm)
            .background(
                RoundedRectangle(cornerRadius: theme.cornerRadius.medium)
                    .strokeBorder(isEnabled ? theme.colorPalette.primary : theme.colorPalette.border, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Tertiary Button Style

struct TertiaryButtonStyle: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(theme.typography.button)
            .foregroundColor(isEnabled ? theme.colorPalette.primary : theme.colorPalette.textDisabled)
            .padding(.horizontal, theme.spacing.sm)
            .padding(.vertical, theme.spacing.xs)
            .background(
                RoundedRectangle(cornerRadius: theme.cornerRadius.small)
                    .fill(configuration.isPressed ? theme.colorPalette.surface : Color.clear)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Icon Button Style

struct IconButtonStyle: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    let backgroundColor: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    init(backgroundColor: Color? = nil) {
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(theme.colorPalette.onPrimary)
            .padding(theme.spacing.sm)
            .background(
                RoundedRectangle(cornerRadius: theme.cornerRadius.medium)
                    .fill(backgroundColor ?? theme.colorPalette.primary)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Destructive Button Style

struct DestructiveButtonStyle: ButtonStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(theme.typography.button)
            .foregroundColor(.white)
            .padding(.horizontal, theme.spacing.md)
            .padding(.vertical, theme.spacing.sm)
            .background(
                RoundedRectangle(cornerRadius: theme.cornerRadius.medium)
                    .fill(isEnabled ? theme.colorPalette.error : theme.colorPalette.textDisabled)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - View Extensions for Easy Usage

extension View {
    func primaryButtonStyle() -> some View {
        self.buttonStyle(PrimaryButtonStyle())
    }
    
    func secondaryButtonStyle() -> some View {
        self.buttonStyle(SecondaryButtonStyle())
    }
    
    func tertiaryButtonStyle() -> some View {
        self.buttonStyle(TertiaryButtonStyle())
    }
    
    func iconButtonStyle(backgroundColor: Color? = nil) -> some View {
        self.buttonStyle(IconButtonStyle(backgroundColor: backgroundColor))
    }
    
    func destructiveButtonStyle() -> some View {
        self.buttonStyle(DestructiveButtonStyle())
    }
}
