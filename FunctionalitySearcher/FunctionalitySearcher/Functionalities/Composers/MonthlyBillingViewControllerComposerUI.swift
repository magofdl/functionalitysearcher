import UIKit

final class MonthlyBillingViewControllerComposerUI {
    static func make(functionality: Functionality, context: AppContext, onDismiss: @escaping () -> Void) -> UIViewController {
        MonthlyBillingViewController(functionality: functionality, userId: context.userId, region: context.region, onDismiss: onDismiss)
    }
}

