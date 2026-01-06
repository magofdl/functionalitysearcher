import UIKit

final class UIKitFunctionality9ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality9(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
    }
}

