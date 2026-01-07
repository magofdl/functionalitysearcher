import UIKit

final class UserAccountDetailsViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        // additionalData is already merged into functionality.arguments by the factory
        UserAccountDetailsViewController(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

