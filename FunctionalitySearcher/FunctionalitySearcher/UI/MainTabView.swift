//
//  MainTabView.swift
//  FunctionalitySearcher
//
//  Main tab container with Home, Search, Profile, and Billing tabs
//

import SwiftUI
import UIKit

struct MainTabView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selectedTab = 0
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let functionalityService: FunctionalityService
    let searchService: SearchServiceProtocol
    let onFunctionalitySelected: (Functionality) -> Void
    
    init(searchService: SearchServiceProtocol, onFunctionalitySelected: @escaping (Functionality) -> Void) {
        self.functionalityService = FunctionalityService()
        self.searchService = searchService
        self.onFunctionalitySelected = onFunctionalitySelected
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1: Home
            HomeView(
                functionalityService: functionalityService,
                onFunctionalitySelected: onFunctionalitySelected,
                onSeeAllTapped: {
                    selectedTab = 1 // Navigate to Search tab
                }
            )
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Tab 2: Search
            SearchView(
                searchService: searchService,
                onFunctionalitySelected: onFunctionalitySelected
            )
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)
            
            // Tab 3: Profile
            ProfileView(
                functionalityService: functionalityService,
                onFunctionalitySelected: onFunctionalitySelected
            )
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(2)
            
            // Tab 4: Billing
            BillingView(
                functionalityService: functionalityService,
                onFunctionalitySelected: onFunctionalitySelected
            )
            .tabItem {
                Label("Billing", systemImage: "dollarsign.circle.fill")
            }
            .tag(3)
        }
        .accentColor(theme.colorPalette.primary)
        .toolbarBackground(theme.colorPalette.surface, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .onChange(of: themeManager.currentThemeType) { _ in
            // Update TabBar appearance when theme changes
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(theme.colorPalette.surface)
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        .onAppear {
            // Configure TabBar appearance on first load
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(theme.colorPalette.surface)
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}
