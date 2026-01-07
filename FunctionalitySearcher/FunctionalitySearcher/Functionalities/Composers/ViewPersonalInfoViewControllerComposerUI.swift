import UIKit

final class ViewPersonalInfoViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        ViewPersonalInfoViewController(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss)
    }
}

