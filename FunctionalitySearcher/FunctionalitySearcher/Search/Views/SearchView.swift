//
//  SearchView.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let onFunctionalitySelected: (Functionality) -> Void
    @FocusState private var isSearchFieldFocused: Bool
    @State private var showThemePicker = false
    
    init(searchService: SearchServiceProtocol, onFunctionalitySelected: @escaping (Functionality) -> Void) {
        _viewModel = StateObject(wrappedValue: SearchViewModel(searchService: searchService))
        self.onFunctionalitySelected = onFunctionalitySelected
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Fixed header section
                VStack(spacing: theme.spacing.md) {
                    // Theme Picker
                    themePickerSection
                    
                // Search bar
                    searchBarSection
                }
                .background(theme.colorPalette.background)
                
                // Scrollable content
                contentSection
            }
            .background(theme.colorPalette.background)
            .navigationTitle("Functionality Searcher")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isSearchFieldFocused {
                        Button {
                            isSearchFieldFocused = false
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                                .foregroundColor(theme.colorPalette.primary)
                        }
                    }
                }
            }
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        if isSearchFieldFocused {
                            isSearchFieldFocused = false
                        }
                    }
            )
        }
    }
    
    // MARK: - View Sections
    
    private var themePickerSection: some View {
                HStack {
            Text("Theme:")
                .subtitle2Style()
            
            Spacer()
            
            Button(action: {
                showThemePicker.toggle()
            }) {
                HStack(spacing: theme.spacing.xs) {
                    Text(themeManager.currentThemeType.rawValue)
                        .bodyStyle()
                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(theme.colorPalette.textSecondary)
                }
            }
            .tertiaryButtonStyle()
        }
        .padding(.horizontal, theme.spacing.md)
        .sheet(isPresented: $showThemePicker) {
            ThemePickerSheet(themeManager: themeManager, isPresented: $showThemePicker)
        }
    }
    
    private var searchBarSection: some View {
        HStack(spacing: theme.spacing.sm) {
                    TextField("Search functionality...", text: $viewModel.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($isSearchFieldFocused)
                        .onSubmit {
                            viewModel.search()
                    isSearchFieldFocused = false
                        }
                    
                    Button(action: {
                        viewModel.search()
                isSearchFieldFocused = false
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
            .iconButtonStyle()
                    .disabled(viewModel.isSearching)
                }
        .padding(.horizontal, theme.spacing.md)
    }
                
    @ViewBuilder
    private var contentSection: some View {
                if viewModel.isSearching {
            loadingView
        } else if let errorMessage = viewModel.errorMessage {
            errorView(errorMessage)
        } else if !viewModel.searchResults.isEmpty {
            resultsListView
        } else if !viewModel.searchQuery.isEmpty {
            noResultsView
        } else {
            emptyStateView
        }
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
                    ProgressView("Searching...")
                .bodyStyle()
            Spacer()
        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorPalette.background)
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFieldFocused = false
        }
    }
    
    private func errorView(_ message: String) -> some View {
        VStack {
            Spacer()
            Text(message)
                .errorText()
                .bodyStyle()
                .padding(theme.spacing.md)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorPalette.background)
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFieldFocused = false
        }
    }
    
    private var resultsListView: some View {
        ZStack {
            theme.colorPalette.background.ignoresSafeArea()
            
            List {
                ForEach(viewModel.searchResults) { result in
                        SearchResultRow(result: result) {
                        isSearchFieldFocused = false
                            onFunctionalitySelected(result.functionality)
                        }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(
                        top: theme.spacing.xs,
                        leading: theme.spacing.md,
                        bottom: theme.spacing.xs,
                        trailing: theme.spacing.md
                    ))
                }
                    }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
    }
    
    private var noResultsView: some View {
        VStack(spacing: theme.spacing.lg) {
                        Spacer()
            
            ZStack {
                Circle()
                    .fill(theme.colorPalette.primary.opacity(0.1))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 48))
                    .foregroundColor(theme.colorPalette.primary)
            }
            
            VStack(spacing: theme.spacing.xs) {
                        Text("No results found")
                    .titleStyle()
                Text("Try different keywords")
                    .captionStyle()
            }
            
                        Spacer()
                    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorPalette.background)
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFieldFocused = false
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: theme.spacing.lg) {
                        Spacer()
            
            ZStack {
                Circle()
                    .fill(theme.colorPalette.secondary.opacity(0.1))
                    .frame(width: 140, height: 140)
                
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.system(size: 64))
                    .foregroundColor(theme.colorPalette.secondary)
            }
            
            VStack(spacing: theme.spacing.sm) {
                Text("Start Searching")
                    .headlineStyle()
                
                Text("Enter a search term to find functionalities")
                    .bodyStyle()
                            .multilineTextAlignment(.center)
                    .padding(.horizontal, theme.spacing.xl)
                
                Text("Try searching for: invoice, billing, profile, orders")
                    .captionStyle()
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.top, theme.spacing.xs)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorPalette.background)
        .contentShape(Rectangle())
        .onTapGesture {
            isSearchFieldFocused = false
        }
    }
}

// MARK: - Search Result Row

struct SearchResultRow: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    let result: SearchResult
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: theme.spacing.sm) {
                // Header with title and badge
                HStack(alignment: .top) {
                    Text(result.functionality.name)
                        .subtitle1Style()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Badge(
                        result.functionality.uiType.rawValue.uppercased(),
                        color: result.functionality.uiType == .swiftui ? theme.colorPalette.secondary : theme.colorPalette.primary
                    )
                }
                
                // Description
                Text(result.functionality.description)
                    .bodyStyle()
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Category and Code cards
                HStack(spacing: theme.spacing.sm) {
                    categoryCodeCard(icon: "folder", title: "Category", value: result.functionality.category)
                    categoryCodeCard(icon: "number", title: "Code", value: result.functionality.code)
                }
                
                // Path
                HStack(spacing: theme.spacing.xs) {
                    Image(systemName: "arrow.turn.down.right")
                    .font(.caption2)
                        .foregroundColor(theme.colorPalette.textTertiary)
                    Text(result.functionality.path)
                        .captionStyle()
                        .lineLimit(1)
                }
            }
            .padding(theme.spacing.md)
            .frame(maxWidth: .infinity)
            .background(theme.colorPalette.surface)
            .cornerRadius(theme.cornerRadius.medium)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func categoryCodeCard(icon: String, title: String, value: String) -> some View {
        HStack(spacing: theme.spacing.xs) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(theme.colorPalette.primary)
                .frame(width: 16)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colorPalette.textTertiary)
                Text(value)
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colorPalette.textPrimary)
                    .fontWeight(.medium)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(theme.spacing.xs)
        .background(theme.colorPalette.background)
        .cornerRadius(theme.cornerRadius.small)
    }
}

// MARK: - Theme Picker Sheet

struct ThemePickerSheet: View {
    @ObservedObject var themeManager: ThemeManager
    
    var theme: Theme {
        themeManager.currentTheme
    }
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                theme.colorPalette.background.ignoresSafeArea()
                
                List(ThemeType.allCases) { themeType in
                    Button(action: {
                        themeManager.setTheme(themeType)
                        isPresented = false
                    }) {
                        HStack(spacing: theme.spacing.md) {
                            VStack(alignment: .leading, spacing: theme.spacing.xs) {
                                Text(themeType.rawValue)
                                    .font(theme.typography.subtitle1)
                                    .foregroundColor(theme.colorPalette.textPrimary)
                                    .fontWeight(.semibold)
                                
                                HStack(spacing: theme.spacing.xs) {
                                    Circle()
                                        .fill(themeType.theme.colorPalette.primary)
                                        .frame(width: 24, height: 24)
                                    Circle()
                                        .fill(themeType.theme.colorPalette.secondary)
                                        .frame(width: 24, height: 24)
                                    Circle()
                                        .fill(themeType.theme.colorPalette.background)
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Circle()
                                                .stroke(theme.colorPalette.border, lineWidth: 1.5)
                                        )
                                }
                            }
                            
                            Spacer()
                            
                            if themeManager.currentThemeType == themeType {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(theme.colorPalette.success)
                            }
                        }
                        .padding(.vertical, theme.spacing.xs)
                    }
                    .listRowBackground(theme.colorPalette.surface)
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Select Theme")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isPresented = false
                    }
                    .foregroundColor(theme.colorPalette.primary)
                }
            }
        }
    }
}
