import UIKit

final class UIKitFunctionality7ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality7(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
    }
}

