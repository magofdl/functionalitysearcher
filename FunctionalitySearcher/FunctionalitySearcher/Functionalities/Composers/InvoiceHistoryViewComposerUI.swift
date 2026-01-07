import UIKit
import SwiftUI

final class InvoiceHistoryViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: InvoiceHistoryView(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

