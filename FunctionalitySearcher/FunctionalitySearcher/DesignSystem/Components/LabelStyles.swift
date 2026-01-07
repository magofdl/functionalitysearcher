//
//  LabelStyles.swift
//  FunctionalitySearcher
//
//  Design System - Label & Text Styles
//

import SwiftUI

// MARK: - Text Style Modifiers

extension View {
    // MARK: Typography Styles
    
    func headlineStyle(color: Color? = nil) -> some View {
        self.modifier(HeadlineStyle(color: color))
    }
    
    func titleStyle(color: Color? = nil) -> some View {
        self.modifier(TitleStyle(color: color))
    }
    
    func subtitle1Style(color: Color? = nil) -> some View {
        self.modifier(Subtitle1Style(color: color))
    }
    
    func subtitle2Style(color: Color? = nil) -> some View {
        self.modifier(Subtitle2Style(color: color))
    }
    
    func bodyStyle(color: Color? = nil) -> some View {
        self.modifier(BodyStyle(color: color))
    }
    
    func captionStyle(color: Color? = nil) -> some View {
        self.modifier(CaptionStyle(color: color))
    }
    
    // MARK: Semantic Text Styles
    
    func primaryText() -> some View {
        self.modifier(PrimaryTextStyle())
    }
    
    func secondaryText() -> some View {
        self.modifier(SecondaryTextStyle())
    }
    
    func tertiaryText() -> some View {
        self.modifier(TertiaryTextStyle())
    }
    
    func errorText() -> some View {
        self.modifier(ErrorTextStyle())
    }
    
    func successText() -> some View {
        self.modifier(SuccessTextStyle())
    }
}

// MARK: - Typography Style Modifiers

struct HeadlineStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.headline)
            .foregroundColor(color ?? theme.colorPalette.textPrimary)
    }
}

struct TitleStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.title)
            .foregroundColor(color ?? theme.colorPalette.textPrimary)
    }
}

struct Subtitle1Style: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.subtitle1)
            .foregroundColor(color ?? theme.colorPalette.textPrimary)
    }
}

struct Subtitle2Style: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.subtitle2)
            .foregroundColor(color ?? theme.colorPalette.textSecondary)
    }
}

struct BodyStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.body)
            .foregroundColor(color ?? theme.colorPalette.textPrimary)
    }
}

struct CaptionStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let color: Color?
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .font(theme.typography.caption)
            .foregroundColor(color ?? theme.colorPalette.textSecondary)
    }
}

// MARK: - Semantic Text Style Modifiers

struct PrimaryTextStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colorPalette.textPrimary)
    }
}

struct SecondaryTextStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colorPalette.textSecondary)
    }
}

struct TertiaryTextStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colorPalette.textTertiary)
    }
}

struct ErrorTextStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colorPalette.error)
    }
}

struct SuccessTextStyle: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colorPalette.success)
    }
}

// MARK: - Label Component

struct ThemedLabel: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let text: String
    let icon: String?
    let style: LabelStyleType
    
    init(_ text: String, icon: String? = nil, style: LabelStyleType = .body) {
        self.text = text
        self.icon = icon
        self.style = style
    }
    
    var body: some View {
        HStack(spacing: theme.spacing.xs) {
            if let icon = icon {
                Image(systemName: icon)
            }
            Text(text)
        }
        .apply(style: style)
    }
}

enum LabelStyleType {
    case headline
    case title
    case subtitle1
    case subtitle2
    case body
    case caption
}

extension View {
    @ViewBuilder
    func apply(style: LabelStyleType) -> some View {
        switch style {
        case .headline:
            self.headlineStyle()
        case .title:
            self.titleStyle()
        case .subtitle1:
            self.subtitle1Style()
        case .subtitle2:
            self.subtitle2Style()
        case .body:
            self.bodyStyle()
        case .caption:
            self.captionStyle()
        }
    }
}
