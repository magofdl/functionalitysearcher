import UIKit

protocol FunctionalityFactoryProtocol {
    func createViewController(for functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController
}
