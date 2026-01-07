import UIKit

final class ViewOrdersViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        ViewOrdersViewController(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
    }
}

