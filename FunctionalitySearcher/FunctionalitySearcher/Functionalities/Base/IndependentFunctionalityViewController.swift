import UIKit

/// Minimal base class for fully independent UIKit functionality screens.
/// It intentionally does NOT render any shared UI (to avoid overlays/stacking).
class IndependentFunctionalityViewController: UIViewController, FunctionalityViewControllerProtocol {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    init(functionality: Functionality, onDismiss: @escaping () -> Void) {
        self.functionality = functionality
        self.onDismiss = onDismiss
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Provide a consistent way to dismiss without forcing UI onto the content.
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(dismissTapped)
        )
        title = functionality.name
    }
    
    @objc private func dismissTapped() {
        onDismiss?()
    }
}

