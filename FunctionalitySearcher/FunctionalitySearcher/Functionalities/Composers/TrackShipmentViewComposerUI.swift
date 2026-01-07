import UIKit
import SwiftUI

final class TrackShipmentViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        let view = TrackShipmentView(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss)
            .environmentObject(ThemeManager.shared)
        return UIHostingController(rootView: view)
    }
}

