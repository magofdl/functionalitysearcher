import UIKit

final class ReturnStatusViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        ReturnStatusViewController(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

