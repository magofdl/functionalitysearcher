import UIKit
import SwiftUI

final class NotificationSettingsViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = NotificationSettingsView(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

