//
//  FunctionalityCardButton.swift
//  FunctionalitySearcher
//
//  Reusable card button for displaying functionalities in grids
//

import SwiftUI

struct FunctionalityCardButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionality: Functionality
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: theme.spacing.sm) {
                // Category Icon
                categoryIcon
                    .font(.system(size: 36))
                    .foregroundColor(theme.colorPalette.primary)
                    .frame(height: 50)
                
                // Functionality Name
                Text(functionality.name)
                    .font(theme.typography.subtitle2)
                    .foregroundColor(theme.colorPalette.textPrimary)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 40)
                
                // Short Description
                Text(functionality.description)
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colorPalette.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 32)
                
                Spacer()
                
                // UIType Badge
                Badge(
                    functionality.uiType.rawValue.uppercased(),
                    color: functionality.uiType == .swiftui ? theme.colorPalette.secondary : theme.colorPalette.primary
                )
            }
            .padding(theme.spacing.md)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(theme.colorPalette.surface)
            .cornerRadius(theme.cornerRadius.medium)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var categoryIcon: some View {
        Image(systemName: iconName(for: functionality.category))
    }
    
    private func iconName(for category: String) -> String {
        switch category {
        case "Billing":
            return "dollarsign.circle.fill"
        case "Returns":
            return "arrow.uturn.left.circle.fill"
        case "Certificates":
            return "doc.badge.gearshape.fill"
        case "Profile":
            return "person.circle.fill"
        case "Products":
            return "cube.box.fill"
        case "Orders":
            return "cart.fill"
        default:
            return "folder.fill"
        }
    }
}
