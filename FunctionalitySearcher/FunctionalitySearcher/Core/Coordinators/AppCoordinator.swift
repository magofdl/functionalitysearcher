import UIKit
import SwiftUI

class AppCoordinator {
    private let window: UIWindow
    private var navigationController: UINavigationController?
    private let searchService: SearchServiceProtocol
    private let functionalityFactory: FunctionalityFactoryProtocol
    
    init(window: UIWindow) {
        self.window = window
        self.searchService = MockSearchService()
        
        // Configure data resolvers for functionalities that need external data
        let dataResolvers: [String: FunctionalityDataResolver] = [
            "PROF_011": UserSubscriptionViewDataResolver(),
            "PROF_010": UserAccountDetailsViewControllerDataResolver()
        ]
        
        self.functionalityFactory = ConcreteFunctionalityFactory(dataResolvers: dataResolvers)
    }
    
    func start() {
        let mainTabView = MainTabView(
            searchService: searchService,
            onFunctionalitySelected: { [weak self] functionality in
                self?.showFunctionality(functionality)
            }
        )
        .themedApp() // Apply theme to the entire app
        
        let hostingController = UIHostingController(rootView: mainTabView)
        let navigationController = UINavigationController(rootViewController: hostingController)
        
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func showFunctionality(_ functionality: Functionality) {
        let context = AppContext.current
        let viewController = functionalityFactory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { [weak self] in
                self?.dismissFunctionality()
            }
        )
        
        if let navigationController = navigationController {
            let modalNavigationController = UINavigationController(rootViewController: viewController)
            modalNavigationController.modalPresentationStyle = .fullScreen
            navigationController.present(modalNavigationController, animated: true)
        }
    }
    
    private func dismissFunctionality() {
        navigationController?.dismiss(animated: true)
    }
}
