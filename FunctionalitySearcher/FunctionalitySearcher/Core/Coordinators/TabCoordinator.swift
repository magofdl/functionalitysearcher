//
//  TabCoordinator.swift
//  FunctionalitySearcher
//
//  Base coordinator for tab-based navigation
//

import UIKit

protocol TabCoordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var functionalityFactory: FunctionalityFactoryProtocol { get }
    
    func start()
    func showFunctionality(_ functionality: Functionality)
}

extension TabCoordinator {
    func showFunctionality(_ functionality: Functionality) {
        let context = AppContext.current
        let viewController = functionalityFactory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { [weak self] in
                self?.dismissFunctionality()
            }
        )
        
        let modalNavigationController = UINavigationController(rootViewController: viewController)
        modalNavigationController.modalPresentationStyle = .fullScreen
        navigationController.present(modalNavigationController, animated: true)
    }
    
    private func dismissFunctionality() {
        navigationController.dismiss(animated: true)
    }
}
