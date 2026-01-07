import UIKit

final class GetCertificateViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        GetCertificateViewController(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
    }
}

