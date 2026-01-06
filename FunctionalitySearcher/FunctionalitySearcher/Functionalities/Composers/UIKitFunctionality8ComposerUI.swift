import UIKit

final class UIKitFunctionality8ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality8(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

