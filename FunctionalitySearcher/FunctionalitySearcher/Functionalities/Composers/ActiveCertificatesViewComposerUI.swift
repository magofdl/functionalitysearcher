import UIKit
import SwiftUI

final class ActiveCertificatesViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: ActiveCertificatesView(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
    }
}

