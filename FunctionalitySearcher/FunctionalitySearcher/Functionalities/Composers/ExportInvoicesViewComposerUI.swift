import UIKit
import SwiftUI

final class ExportInvoicesViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: ExportInvoicesView(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
    }
}

