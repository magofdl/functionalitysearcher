import UIKit
import SwiftUI

final class SwiftUIFunctionality5ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality5(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
    }
}

