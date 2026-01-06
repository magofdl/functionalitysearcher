import UIKit

final class UIKitFunctionality10WithExternalDataComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        // additionalData is already merged into functionality.arguments by the factory
        UIKitFunctionality10WithExternalData(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

