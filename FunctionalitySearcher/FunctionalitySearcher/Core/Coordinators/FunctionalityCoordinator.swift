//
//  FunctionalityCoordinator.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class FunctionalityCoordinator {
    private let navigationController: UINavigationController
    private let functionalityFactory: FunctionalityFactoryProtocol
    
    init(navigationController: UINavigationController, functionalityFactory: FunctionalityFactoryProtocol) {
        self.navigationController = navigationController
        self.functionalityFactory = functionalityFactory
    }
    
    func showFunctionality(_ functionality: Functionality) {
        let viewController = functionalityFactory.createViewController(
            for: functionality,
            onDismiss: { [weak self] in
                self?.dismissFunctionality()
            }
        )
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func dismissFunctionality() {
        navigationController.popViewController(animated: true)
    }
}
