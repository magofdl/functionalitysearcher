//
//  SearchCoordinator.swift
//  FunctionalitySearcher
//
//  Coordinator for Search tab
//

import UIKit
import SwiftUI

final class SearchCoordinator: TabCoordinator {
    let navigationController: UINavigationController
    let functionalityFactory: FunctionalityFactoryProtocol
    private let searchService: SearchServiceProtocol
    
    init(
        navigationController: UINavigationController,
        functionalityFactory: FunctionalityFactoryProtocol,
        searchService: SearchServiceProtocol
    ) {
        self.navigationController = navigationController
        self.functionalityFactory = functionalityFactory
        self.searchService = searchService
    }
    
    func start() {
        let searchView = SearchView(
            searchService: searchService,
            onFunctionalitySelected: { [weak self] functionality in
                self?.showFunctionality(functionality)
            }
        )
        .themedApp()
        
        let hostingController = UIHostingController(rootView: searchView)
        hostingController.title = "Functionality Searcher"
        hostingController.navigationItem.largeTitleDisplayMode = .always
        
        // Enable large titles
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([hostingController], animated: false)
    }
}
