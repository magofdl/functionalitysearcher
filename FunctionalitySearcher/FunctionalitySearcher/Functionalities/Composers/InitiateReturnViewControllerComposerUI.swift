import UIKit

final class InitiateReturnViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        InitiateReturnViewController(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
    }
}

