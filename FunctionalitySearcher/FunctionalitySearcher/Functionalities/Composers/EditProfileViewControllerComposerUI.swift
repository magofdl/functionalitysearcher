import UIKit

final class EditProfileViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        EditProfileViewController(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss)
    }
}

