import UIKit

final class UIKitFunctionality5ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality5(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
    }
}

