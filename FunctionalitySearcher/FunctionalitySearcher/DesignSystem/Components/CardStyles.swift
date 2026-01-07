//
//  CardStyles.swift
//  FunctionalitySearcher
//
//  Design System - Card & Container Styles
//

import SwiftUI

// MARK: - Card Component

struct ThemedCard<Content: View>: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let content: Content
    let padding: CGFloat?
    
    init(padding: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(padding ?? theme.spacing.md)
            .background(theme.colorPalette.surface)
            .cornerRadius(theme.cornerRadius.medium)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Info Card Component

struct InfoCard: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let title: String
    let value: String
    let icon: String?
    
    init(title: String, value: String, icon: String? = nil) {
        self.title = title
        self.value = value
        self.icon = icon
    }
    
    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(theme.colorPalette.primary)
            }
            
            VStack(alignment: .leading, spacing: theme.spacing.xs) {
                Text(title)
                    .captionStyle()
                Text(value)
                    .subtitle2Style()
            }
            
            Spacer()
        }
        .padding(theme.spacing.sm)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.small)
    }
}

// MARK: - View Modifiers

extension View {
    func cardStyle(padding: CGFloat? = nil) -> some View {
        ThemedCard(padding: padding) {
            self
        }
    }
    
    func surfaceBackground() -> some View {
        self.modifier(SurfaceBackgroundModifier())
    }
    
    func primaryBackground() -> some View {
        self.modifier(PrimaryBackgroundModifier())
    }
}

struct SurfaceBackgroundModifier: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .background(theme.colorPalette.surface)
    }
}

struct PrimaryBackgroundModifier: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .background(theme.colorPalette.background)
    }
}

// MARK: - Divider

struct ThemedDivider: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    var body: some View {
        Divider()
            .background(theme.colorPalette.divider)
    }
}

// MARK: - Badge Component

struct Badge: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let text: String
    let color: Color?
    
    init(_ text: String, color: Color? = nil) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        Text(text)
            .font(theme.typography.caption)
            .foregroundColor(.white)
            .padding(.horizontal, theme.spacing.sm)
            .padding(.vertical, theme.spacing.xs)
            .background(color ?? theme.colorPalette.primary)
            .cornerRadius(theme.cornerRadius.round)
    }
}
