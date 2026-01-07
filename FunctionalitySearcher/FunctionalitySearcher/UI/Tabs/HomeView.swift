//
//  HomeView.swift
//  FunctionalitySearcher
//
//  Home tab with dashboard and quick access
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionalityService: FunctionalityService
    let onFunctionalitySelected: (Functionality) -> Void
    let onSeeAllTapped: () -> Void
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: theme.spacing.lg) {
                    // Welcome Header
                    welcomeHeader
                    
                    // Summary Cards
                    summaryCardsSection
                    
                    // Quick Access
                    quickAccessSection
                }
                .padding(theme.spacing.md)
            }
            .background(theme.colorPalette.background)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    private var welcomeHeader: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text("Welcome back!")
                .font(theme.typography.headline)
                .foregroundColor(theme.colorPalette.textPrimary)
            
            Text("Explore your functionalities")
                .font(theme.typography.body)
                .foregroundColor(theme.colorPalette.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var summaryCardsSection: some View {
        VStack(spacing: theme.spacing.sm) {
            Text("Overview")
                .font(theme.typography.title)
                .foregroundColor(theme.colorPalette.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: theme.spacing.sm) {
                summaryCard(
                    title: "Total",
                    value: "\(functionalityService.getAllFunctionalities().count)",
                    icon: "square.grid.2x2.fill",
                    color: theme.colorPalette.primary
                )
                
                summaryCard(
                    title: "Categories",
                    value: "\(functionalityService.getAllCategories().count)",
                    icon: "folder.fill",
                    color: theme.colorPalette.secondary
                )
            }
            
            HStack(spacing: theme.spacing.sm) {
                summaryCard(
                    title: "SwiftUI",
                    value: "\(functionalityService.getAllFunctionalities().filter { $0.uiType == .swiftui }.count)",
                    icon: "swift",
                    color: theme.colorPalette.success
                )
                
                summaryCard(
                    title: "UIKit",
                    value: "\(functionalityService.getAllFunctionalities().filter { $0.uiType == .uikit }.count)",
                    icon: "hammer.fill",
                    color: theme.colorPalette.info
                )
            }
        }
    }
    
    private func summaryCard(title: String, value: String, icon: String, color: Color) -> some View {
        VStack(spacing: theme.spacing.sm) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(color)
            
            Text(value)
                .font(theme.typography.title)
                .foregroundColor(theme.colorPalette.textPrimary)
                .fontWeight(.bold)
            
            Text(title)
                .font(theme.typography.caption)
                .foregroundColor(theme.colorPalette.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(theme.spacing.md)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.medium)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
    
    private var quickAccessSection: some View {
        VStack(spacing: theme.spacing.md) {
            HStack {
                Text("Quick Access")
                    .font(theme.typography.title)
                    .foregroundColor(theme.colorPalette.textPrimary)
                
                Spacer()
                
                Button(action: onSeeAllTapped) {
                    HStack(spacing: theme.spacing.xs) {
                        Text("See All")
                            .font(theme.typography.caption)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                    .foregroundColor(theme.colorPalette.primary)
                }
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: theme.spacing.md) {
                ForEach(functionalityService.getRecentFunctionalities(limit: 6)) { functionality in
                    FunctionalityCardButton(
                        functionality: functionality,
                        onTap: {
                            onFunctionalitySelected(functionality)
                        }
                    )
                }
            }
        }
    }
}
