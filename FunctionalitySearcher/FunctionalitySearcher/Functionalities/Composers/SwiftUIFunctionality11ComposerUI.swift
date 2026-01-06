import UIKit
import SwiftUI

final class SwiftUIFunctionality11ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality11(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

