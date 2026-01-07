import UIKit
import SwiftUI

final class UserSubscriptionViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = UserSubscriptionView(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

