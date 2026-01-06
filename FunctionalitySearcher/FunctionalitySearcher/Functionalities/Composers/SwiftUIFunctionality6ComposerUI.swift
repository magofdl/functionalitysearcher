import UIKit
import SwiftUI

final class SwiftUIFunctionality6ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality6(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss))
    }
}

