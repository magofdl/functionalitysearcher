//
//  SearchServiceProtocol.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation

protocol SearchServiceProtocol {
    func search(query: String) async -> [SearchResult]
    func getAllFunctionalities() -> [Functionality]
}
