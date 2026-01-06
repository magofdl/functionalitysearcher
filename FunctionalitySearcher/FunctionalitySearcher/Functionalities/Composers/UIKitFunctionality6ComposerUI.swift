import UIKit

final class UIKitFunctionality6ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality6(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
    }
}

