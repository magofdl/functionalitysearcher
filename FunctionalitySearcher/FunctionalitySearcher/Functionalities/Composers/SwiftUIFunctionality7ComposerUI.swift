import UIKit
import SwiftUI

final class SwiftUIFunctionality7ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality7(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
    }
}

