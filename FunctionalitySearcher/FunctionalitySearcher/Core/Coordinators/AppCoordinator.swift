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
        self.functionalityFactory = ConcreteFunctionalityFactory()
    }
    
    func start() {
        let searchView = SearchView(searchService: searchService) { [weak self] functionality in
            self?.showFunctionality(functionality)
        }
        
        let hostingController = UIHostingController(rootView: searchView)
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
            navigationController.present(modalNavigationController, animated: true)
        }
    }
    
    private func dismissFunctionality() {
        navigationController?.dismiss(animated: true)
    }
}
