import UIKit
import SwiftUI

final class UserSubscriptionViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: UserSubscriptionView(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

