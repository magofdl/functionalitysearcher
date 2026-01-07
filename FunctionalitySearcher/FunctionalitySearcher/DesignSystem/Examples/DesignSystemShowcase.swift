//
//  DesignSystemShowcase.swift
//  FunctionalitySearcher
//
//  Design System Usage Examples
//

import SwiftUI

/// Example view showing how to use the Design System components
struct DesignSystemShowcase: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    @State private var counter = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.lg) {
                
                // MARK: - Typography Examples
                
                VStack(alignment: .leading, spacing: theme.spacing.sm) {
                    Text("Typography")
                        .headlineStyle()
                    
                    ThemedDivider()
                    
                    Text("Headline Style")
                        .headlineStyle()
                    
                    Text("Title Style")
                        .titleStyle()
                    
                    Text("Subtitle 1 Style")
                        .subtitle1Style()
                    
                    Text("Subtitle 2 Style")
                        .subtitle2Style()
                    
                    Text("Body Style - This is regular body text for paragraphs and content")
                        .bodyStyle()
                    
                    Text("Caption Style - Small text for labels and metadata")
                        .captionStyle()
                }
                .cardStyle()
                
                // MARK: - Button Examples
                
                VStack(alignment: .leading, spacing: theme.spacing.sm) {
                    Text("Buttons")
                        .headlineStyle()
                    
                    ThemedDivider()
                    
                    Button("Primary Button") {
                        print("Primary tapped")
                    }
                    .primaryButtonStyle()
                    
                    Button("Secondary Button") {
                        print("Secondary tapped")
                    }
                    .secondaryButtonStyle()
                    
                    Button("Tertiary Button") {
                        print("Tertiary tapped")
                    }
                    .tertiaryButtonStyle()
                    
                    Button {
                        print("Icon button tapped")
                    } label: {
                        Image(systemName: "star.fill")
                    }
                    .iconButtonStyle()
                    
                    Button("Destructive Button") {
                        print("Destructive tapped")
                    }
                    .destructiveButtonStyle()
                }
                .cardStyle()
                
                // MARK: - Card Examples
                
                VStack(alignment: .leading, spacing: theme.spacing.sm) {
                    Text("Cards & Components")
                        .headlineStyle()
                    
                    ThemedDivider()
                    
                    InfoCard(
                        title: "User Name",
                        value: "John Doe",
                        icon: "person.fill"
                    )
                    
                    InfoCard(
                        title: "Email",
                        value: "john@example.com",
                        icon: "envelope.fill"
                    )
                    
                    HStack {
                        Badge("New")
                        Badge("Popular", color: theme.colorPalette.success)
                        Badge("Premium", color: theme.colorPalette.secondary)
                    }
                }
                .cardStyle()
                
                // MARK: - Interactive Example
                
                VStack(spacing: theme.spacing.md) {
                    Text("Interactive Counter")
                        .titleStyle()
                    
                    Text("Count: \(counter)")
                        .headlineStyle(color: theme.colorPalette.primary)
                    
                    HStack(spacing: theme.spacing.md) {
                        Button {
                            counter -= 1
                        } label: {
                            Image(systemName: "minus")
                        }
                        .iconButtonStyle(backgroundColor: theme.colorPalette.error)
                        
                        Button {
                            counter = 0
                        } label: {
                            Text("Reset")
                        }
                        .secondaryButtonStyle()
                        
                        Button {
                            counter += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                        .iconButtonStyle(backgroundColor: theme.colorPalette.success)
                    }
                }
                .cardStyle()
                
                // MARK: - Color Palette
                
                VStack(alignment: .leading, spacing: theme.spacing.sm) {
                    Text("Color Palette")
                        .headlineStyle()
                    
                    ThemedDivider()
                    
                    colorRow(name: "Primary", color: theme.colorPalette.primary)
                    colorRow(name: "Secondary", color: theme.colorPalette.secondary)
                    colorRow(name: "Success", color: theme.colorPalette.success)
                    colorRow(name: "Error", color: theme.colorPalette.error)
                    colorRow(name: "Warning", color: theme.colorPalette.warning)
                    colorRow(name: "Info", color: theme.colorPalette.info)
                }
                .cardStyle()
            }
            .padding(theme.spacing.md)
        }
        .background(theme.colorPalette.background)
    }
    
    private func colorRow(name: String, color: Color) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: theme.cornerRadius.small)
                .fill(color)
                .frame(width: 50, height: 30)
            
            Text(name)
                .bodyStyle()
            
            Spacer()
        }
    }
}

// MARK: - Preview

struct DesignSystemShowcase_Previews: PreviewProvider {
    static var previews: some View {
        DesignSystemShowcase()
            .themedApp()
    }
}
