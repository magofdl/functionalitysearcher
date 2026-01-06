import UIKit
import SwiftUI

final class SwiftUIFunctionality10ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality10(functionality: functionality, userId: context.userId, userRole: context.userRole, onDismiss: onDismiss))
    }
}

