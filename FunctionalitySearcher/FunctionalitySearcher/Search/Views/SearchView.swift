//
//  SearchView.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel
    let onFunctionalitySelected: (Functionality) -> Void
    @FocusState private var isSearchFieldFocused: Bool
    
    init(searchService: SearchServiceProtocol, onFunctionalitySelected: @escaping (Functionality) -> Void) {
        _viewModel = StateObject(wrappedValue: SearchViewModel(searchService: searchService))
        self.onFunctionalitySelected = onFunctionalitySelected
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Search bar
                HStack {
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
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .disabled(viewModel.isSearching)
                }
                .padding(.horizontal)
                
                // Loading indicator
                if viewModel.isSearching {
                    ProgressView("Searching...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSearchFieldFocused = false
                        }
                }
                
                // Error message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Results list
                if !viewModel.searchResults.isEmpty {
                    List(viewModel.searchResults) { result in
                        SearchResultRow(result: result) {
                            onFunctionalitySelected(result.functionality)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .simultaneousGesture(
                        TapGesture().onEnded { _ in
                            isSearchFieldFocused = false
                        }
                    )
                } else if !viewModel.isSearching && !viewModel.searchQuery.isEmpty {
                    VStack {
                        Spacer()
                        Text("No results found")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isSearchFieldFocused = false
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("Enter a search term to begin")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isSearchFieldFocused = false
                    }
                }
            }
            .navigationTitle("Functionality Searcher")
            .navigationBarTitleDisplayMode(.large)
            .onTapGesture {
                isSearchFieldFocused = false
            }
        }
    }
}

struct SearchResultRow: View {
    let result: SearchResult
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(result.functionality.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    
                }
                
                Text(result.functionality.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Text("Category: \(result.functionality.category)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Code: \(result.functionality.code)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text("Path: \(result.functionality.path)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
