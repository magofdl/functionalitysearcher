import UIKit
import SwiftUI

final class ActiveCertificatesViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = ActiveCertificatesView(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

