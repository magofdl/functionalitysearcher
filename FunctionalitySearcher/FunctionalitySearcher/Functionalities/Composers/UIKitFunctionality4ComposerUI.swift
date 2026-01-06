import UIKit

final class UIKitFunctionality4ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality4(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss)
    }
}

