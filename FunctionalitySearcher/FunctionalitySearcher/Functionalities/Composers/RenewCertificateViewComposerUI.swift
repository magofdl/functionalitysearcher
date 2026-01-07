import UIKit
import SwiftUI

final class RenewCertificateViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = RenewCertificateView(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

