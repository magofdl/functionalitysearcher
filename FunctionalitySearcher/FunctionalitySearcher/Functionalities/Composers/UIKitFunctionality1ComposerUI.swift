import UIKit

final class UIKitFunctionality1ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality1(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

