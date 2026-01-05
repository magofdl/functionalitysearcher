//
//  MockSearchService.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation

class MockSearchService: SearchServiceProtocol {
    private let functionalities: [Functionality]
    
    init(functionalities: [Functionality] = FunctionalityDataProvider.generateMockFunctionalities()) {
        self.functionalities = functionalities
    }
    
    func getAllFunctionalities() -> [Functionality] {
        return functionalities
    }
    
    func search(query: String) async -> [SearchResult] {
        // Simular delay de red
        try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 segundos
        
        let lowercaseQuery = query.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if lowercaseQuery.isEmpty {
            return []
        }
        
        var results: [SearchResult] = []
        
        for functionality in functionalities {
            let score = calculateRelevanceScore(functionality: functionality, query: lowercaseQuery)
            if score > 0 {
                results.append(SearchResult(functionality: functionality, relevanceScore: score))
            }
        }
        
        // Ordenar por relevancia (mayor a menor)
        return results.sorted { $0.relevanceScore > $1.relevanceScore }
    }
    
    private func calculateRelevanceScore(functionality: Functionality, query: String) -> Double {
        var score: Double = 0.0
        let queryWords = query.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        
        // Buscar coincidencias exactas en el nombre
        let lowercaseName = functionality.name.lowercased()
        if lowercaseName.contains(query) {
            score += 100.0
        }
        
        // Buscar palabras individuales en el nombre
        for word in queryWords {
            if lowercaseName.contains(word) {
                score += 50.0
            }
        }
        
        // Buscar en keywords
        let lowercaseKeywords = functionality.keywords.map { $0.lowercased() }
        for keyword in lowercaseKeywords {
            if keyword.contains(query) {
                score += 30.0
            }
            for word in queryWords {
                if keyword.contains(word) {
                    score += 15.0
                }
            }
        }
        
        // Buscar en descripción
        let lowercaseDescription = functionality.description.lowercased()
        for word in queryWords {
            if lowercaseDescription.contains(word) {
                score += 10.0
            }
        }
        
        // Buscar en categoría
        let lowercaseCategory = functionality.category.lowercased()
        if lowercaseCategory.contains(query) {
            score += 25.0
        }
        
        // Buscar en código
        if functionality.code.lowercased().contains(query) {
            score += 20.0
        }
        
        return score
    }
}
