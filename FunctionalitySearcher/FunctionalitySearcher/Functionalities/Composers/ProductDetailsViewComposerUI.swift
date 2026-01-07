import UIKit
import SwiftUI

final class ProductDetailsViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = ProductDetailsView(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

