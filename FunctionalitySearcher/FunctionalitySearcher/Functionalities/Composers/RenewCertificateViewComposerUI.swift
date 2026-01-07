import UIKit
import SwiftUI

final class RenewCertificateViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: RenewCertificateView(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
    }
}

