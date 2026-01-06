import UIKit

final class UIKitFunctionality2ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality2(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
    }
}

