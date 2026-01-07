import UIKit
import SwiftUI

final class NotificationSettingsViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: NotificationSettingsView(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss))
    }
}

