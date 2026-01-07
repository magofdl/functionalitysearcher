import UIKit

final class DownloadCertificateViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        DownloadCertificateViewController(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
    }
}

