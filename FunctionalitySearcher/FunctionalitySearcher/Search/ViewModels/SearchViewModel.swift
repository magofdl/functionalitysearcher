//
//  SearchViewModel.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var searchResults: [SearchResult] = []
    @Published var isSearching: Bool = false
    @Published var errorMessage: String?
    
    private let searchService: SearchServiceProtocol
    private var searchTask: Task<Void, Never>?
    
    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }
    
    func search() {
        // Cancelar búsqueda anterior si existe
        searchTask?.cancel()
        
        guard !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            searchResults = []
            return
        }
        
        isSearching = true
        errorMessage = nil
        
        searchTask = Task { [weak self] in
            guard let self = self else { return }
            
            do {
                let results = await self.searchService.search(query: self.searchQuery)
                
                if !Task.isCancelled {
                    self.searchResults = results
                    self.isSearching = false
                }
            } catch {
                if !Task.isCancelled {
                    self.errorMessage = "Error searching: \(error.localizedDescription)"
                    self.isSearching = false
                    self.searchResults = []
                }
            }
        }
    }
    
    func clearSearch() {
        searchTask?.cancel()
        searchQuery = ""
        searchResults = []
        isSearching = false
        errorMessage = nil
    }
}
