import UIKit
import SwiftUI

final class ProductDetailsViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: ProductDetailsView(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
    }
}

