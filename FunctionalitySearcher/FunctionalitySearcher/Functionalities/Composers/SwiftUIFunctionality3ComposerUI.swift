import UIKit
import SwiftUI

final class SwiftUIFunctionality3ComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: SwiftUIFunctionality3(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss))
    }
}

