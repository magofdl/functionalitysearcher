//
//  HomeCoordinator.swift
//  FunctionalitySearcher
//
//  Coordinator for Home tab
//

import UIKit
import SwiftUI

final class HomeCoordinator: TabCoordinator {
    let navigationController: UINavigationController
    let functionalityFactory: FunctionalityFactoryProtocol
    private let functionalityService: FunctionalityService
    private weak var tabBarController: UITabBarController?
    
    init(
        navigationController: UINavigationController,
        functionalityFactory: FunctionalityFactoryProtocol,
        tabBarController: UITabBarController?
    ) {
        self.navigationController = navigationController
        self.functionalityFactory = functionalityFactory
        self.functionalityService = FunctionalityService()
        self.tabBarController = tabBarController
    }
    
    func start() {
        let homeView = HomeView(
            functionalityService: functionalityService,
            onFunctionalitySelected: { [weak self] functionality in
                self?.showFunctionality(functionality)
            },
            onSeeAllTapped: { [weak self] in
                self?.navigateToSearchTab()
            }
        )
        .themedApp()
        
        let hostingController = UIHostingController(rootView: homeView)
        hostingController.title = "Home"
        hostingController.navigationItem.largeTitleDisplayMode = .always
        
        // Enable large titles
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([hostingController], animated: false)
    }
    
    private func navigateToSearchTab() {
        tabBarController?.selectedIndex = 1
    }
}
