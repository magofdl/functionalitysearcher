//
//  ProfileCoordinator.swift
//  FunctionalitySearcher
//
//  Coordinator for Profile tab
//

import UIKit
import SwiftUI

final class ProfileCoordinator: TabCoordinator {
    let navigationController: UINavigationController
    let functionalityFactory: FunctionalityFactoryProtocol
    private let functionalityService: FunctionalityService
    
    init(
        navigationController: UINavigationController,
        functionalityFactory: FunctionalityFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.functionalityFactory = functionalityFactory
        self.functionalityService = FunctionalityService()
    }
    
    func start() {
        let profileView = ProfileView(
            functionalityService: functionalityService,
            onFunctionalitySelected: { [weak self] functionality in
                self?.showFunctionality(functionality)
            }
        )
        .themedApp()
        
        let hostingController = UIHostingController(rootView: profileView)
        hostingController.title = "Profile"
        hostingController.navigationItem.largeTitleDisplayMode = .always
        
        // Enable large titles
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([hostingController], animated: false)
    }
}
