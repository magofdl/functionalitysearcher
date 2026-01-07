import UIKit
import SwiftUI

final class TrackShipmentViewComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        UIHostingController(rootView: TrackShipmentView(functionality: functionality, userId: context.userId, timestamp: context.timestamp, onDismiss: onDismiss))
    }
}

