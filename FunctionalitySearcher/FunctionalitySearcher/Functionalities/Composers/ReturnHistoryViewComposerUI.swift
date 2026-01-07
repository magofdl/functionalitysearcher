import UIKit
import SwiftUI

final class ReturnHistoryViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: ReturnHistoryView(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

