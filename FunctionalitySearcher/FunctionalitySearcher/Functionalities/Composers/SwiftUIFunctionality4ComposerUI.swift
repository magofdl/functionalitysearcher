import UIKit
import SwiftUI

final class SwiftUIFunctionality4ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality4(functionality: functionality, userId: context.userId, userEmail: context.userEmail, onDismiss: onDismiss))
    }
}

