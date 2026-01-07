import UIKit
import SwiftUI

final class InvoiceHistoryViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = InvoiceHistoryView(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

