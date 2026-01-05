import UIKit

class FunctionalityCoordinator {
    private let navigationController: UINavigationController
    private let functionalityFactory: FunctionalityFactoryProtocol
    
    init(navigationController: UINavigationController, functionalityFactory: FunctionalityFactoryProtocol) {
        self.navigationController = navigationController
        self.functionalityFactory = functionalityFactory
    }
    
    func showFunctionality(_ functionality: Functionality) {
        let context = AppContext.current
        let viewController = functionalityFactory.createViewController(
            for: functionality,
            context: context,
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
