import UIKit
import SwiftUI

final class SwiftUIFunctionality2ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality2(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss))
    }
}

