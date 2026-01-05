//
//  SearchResult.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation

struct SearchResult: Identifiable, Hashable {
    let id: String
    let functionality: Functionality
    let relevanceScore: Double
    
    init(functionality: Functionality, relevanceScore: Double) {
        self.id = functionality.id
        self.functionality = functionality
        self.relevanceScore = relevanceScore
    }
}
