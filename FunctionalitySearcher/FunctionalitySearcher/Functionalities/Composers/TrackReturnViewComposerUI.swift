import UIKit
import SwiftUI

final class TrackReturnViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = TrackReturnView(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

