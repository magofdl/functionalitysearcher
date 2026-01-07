//
//  BillingCoordinator.swift
//  FunctionalitySearcher
//
//  Coordinator for Billing tab
//

import UIKit
import SwiftUI

final class BillingCoordinator: TabCoordinator {
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
        let billingView = BillingView(
            functionalityService: functionalityService,
            onFunctionalitySelected: { [weak self] functionality in
                self?.showFunctionality(functionality)
            }
        )
        .themedApp()
        
        let hostingController = UIHostingController(rootView: billingView)
        hostingController.title = "Billing"
        hostingController.navigationItem.largeTitleDisplayMode = .always
        
        // Enable large titles
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.setViewControllers([hostingController], animated: false)
    }
}
