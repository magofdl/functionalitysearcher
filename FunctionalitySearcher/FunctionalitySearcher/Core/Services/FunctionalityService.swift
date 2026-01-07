//
//  FunctionalityService.swift
//  FunctionalitySearcher
//
//  Service to provide and filter functionalities
//

import Foundation

class FunctionalityService {
    private let allFunctionalities: [Functionality]
    
    init() {
        self.allFunctionalities = FunctionalityDataProvider.generateMockFunctionalities()
    }
    
    /// Get all functionalities
    func getAllFunctionalities() -> [Functionality] {
        return allFunctionalities
    }
    
    /// Get functionalities filtered by category
    func getFunctionalities(byCategory category: String) -> [Functionality] {
        return allFunctionalities.filter { $0.category == category }
    }
    
    /// Get recent functionalities (first N items)
    func getRecentFunctionalities(limit: Int) -> [Functionality] {
        return Array(allFunctionalities.prefix(limit))
    }
    
    /// Get functionality by code
    func getFunctionality(byCode code: String) -> Functionality? {
        return allFunctionalities.first { $0.code == code }
    }
    
    /// Get count of functionalities by category
    func getFunctionalityCount(byCategory category: String) -> Int {
        return getFunctionalities(byCategory: category).count
    }
    
    /// Get all unique categories
    func getAllCategories() -> [String] {
        return Array(Set(allFunctionalities.map { $0.category })).sorted()
    }
}
