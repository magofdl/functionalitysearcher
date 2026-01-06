import UIKit
import SwiftUI

final class SwiftUIFunctionality8ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality8(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

