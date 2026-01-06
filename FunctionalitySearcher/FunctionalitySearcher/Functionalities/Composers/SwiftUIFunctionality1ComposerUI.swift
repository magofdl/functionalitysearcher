import UIKit
import SwiftUI

final class SwiftUIFunctionality1ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality1(functionality: functionality, userId: context.userId, onDismiss: onDismiss))
    }
}

