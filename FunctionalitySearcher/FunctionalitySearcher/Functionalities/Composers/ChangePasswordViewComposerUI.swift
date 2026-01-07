import UIKit
import SwiftUI

final class ChangePasswordViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: ChangePasswordView(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss))
    }
}

