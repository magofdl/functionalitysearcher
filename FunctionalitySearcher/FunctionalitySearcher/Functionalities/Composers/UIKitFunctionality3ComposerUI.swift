import UIKit

final class UIKitFunctionality3ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIKitFunctionality3(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
    }
}

