import UIKit

final class DownloadInvoiceViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        DownloadInvoiceViewController(functionality: functionality, userId: context.userId, onDismiss: onDismiss)
    }
}

