//
//  ProfileView.swift
//  FunctionalitySearcher
//
//  Profile tab with user info and profile functionalities
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionalityService: FunctionalityService
    let onFunctionalitySelected: (Functionality) -> Void
    
    private var profileFunctionalities: [Functionality] {
        functionalityService.getFunctionalities(byCategory: "Profile")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background that extends everywhere
                theme.colorPalette.background
                    .ignoresSafeArea(edges: .all)
                
                ScrollView {
                    VStack(spacing: theme.spacing.lg) {
                        // User Header
                        userHeader
                        
                        // Account Summary
                        accountSummary
                        
                        // Profile Functionalities Title
                        Text("Profile Management")
                            .font(theme.typography.title)
                            .foregroundColor(theme.colorPalette.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, theme.spacing.md)
                        
                        // Grid of Profile Functionalities
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: theme.spacing.md) {
                            ForEach(profileFunctionalities) { functionality in
                                FunctionalityCardButton(
                                    functionality: functionality,
                                    onTap: {
                                        onFunctionalitySelected(functionality)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, theme.spacing.md)
                    }
                    .padding(.vertical, theme.spacing.md)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(theme.colorPalette.surface, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(themeManager.currentThemeType == .dark ? .dark : .light, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .onAppear {
                configureNavigationBarAppearance()
            }
            .onChange(of: themeManager.currentThemeType) { _ in
                configureNavigationBarAppearance()
            }
        }
    }
    
    private var userHeader: some View {
        VStack(spacing: theme.spacing.md) {
            // Avatar
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [theme.colorPalette.primary, theme.colorPalette.secondary],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            
            // User Info
            VStack(spacing: theme.spacing.xs) {
                Text("John Doe")
                    .font(theme.typography.title)
                    .foregroundColor(theme.colorPalette.textPrimary)
                    .fontWeight(.semibold)
                
                Text("john.doe@example.com")
                    .font(theme.typography.body)
                    .foregroundColor(theme.colorPalette.textSecondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(theme.spacing.lg)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.large)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, theme.spacing.md)
    }
    
    private var accountSummary: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text("Account Summary")
                .font(theme.typography.subtitle1)
                .foregroundColor(theme.colorPalette.textPrimary)
                .fontWeight(.semibold)
            
            VStack(spacing: theme.spacing.sm) {
                InfoCard(
                    title: "Subscription",
                    value: "Premium",
                    icon: "crown.fill"
                )
                
                InfoCard(
                    title: "Member Since",
                    value: "January 2024",
                    icon: "calendar"
                )
                
                InfoCard(
                    title: "Account Status",
                    value: "Active",
                    icon: "checkmark.circle.fill"
                )
            }
        }
        .padding(theme.spacing.md)
        .background(theme.colorPalette.surface)
        .cornerRadius(theme.cornerRadius.medium)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, theme.spacing.md)
    }
    
    private func configureNavigationBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(theme.colorPalette.surface)
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(theme.colorPalette.textPrimary)
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(theme.colorPalette.textPrimary)
        ]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
