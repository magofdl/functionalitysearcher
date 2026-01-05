//
//  Functionality.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation

struct Functionality: Codable, Identifiable, Hashable {
    let id: String
    let code: String
    let name: String
    let path: String
    let category: String
    let description: String
    let keywords: [String]
    let uiType: UIType
    
    init(id: String, code: String, name: String, path: String, category: String, description: String, keywords: [String], uiType: UIType) {
        self.id = id
        self.code = code
        self.name = name
        self.path = path
        self.category = category
        self.description = description
        self.keywords = keywords
        self.uiType = uiType
    }
}
