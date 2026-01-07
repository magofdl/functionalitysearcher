import UIKit

final class SearchProductsViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        SearchProductsViewController(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
    }
}

