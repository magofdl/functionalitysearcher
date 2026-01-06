import UIKit
import SwiftUI

final class SwiftUIFunctionality9ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality9(functionality: functionality, userId: context.userId, contractCount: context.contractCount, onDismiss: onDismiss))
    }
}

