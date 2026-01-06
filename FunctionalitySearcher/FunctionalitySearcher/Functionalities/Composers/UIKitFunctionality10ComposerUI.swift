import UIKit

final class UIKitFunctionality10ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality10(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss)
    }
}

