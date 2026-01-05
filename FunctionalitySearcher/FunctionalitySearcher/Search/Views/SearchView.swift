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
                        .onSubmit {
                            viewModel.search()
                        }
                    
                    Button(action: {
                        viewModel.search()
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
                } else if !viewModel.isSearching && !viewModel.searchQuery.isEmpty {
                    VStack {
                        Spacer()
                        Text("No results found")
                            .foregroundColor(.gray)
                        Spacer()
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
                }
            }
            .navigationTitle("Functionality Searcher")
            .navigationBarTitleDisplayMode(.large)
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
                    Text(result.functionality.uiType.rawValue.uppercased())
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(result.functionality.uiType == .uikit ? Color.orange.opacity(0.2) : Color.blue.opacity(0.2))
                        .foregroundColor(result.functionality.uiType == .uikit ? .orange : .blue)
                        .cornerRadius(4)
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
