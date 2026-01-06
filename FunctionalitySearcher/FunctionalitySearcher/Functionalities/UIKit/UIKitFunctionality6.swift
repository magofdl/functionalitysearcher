import UIKit

class UIKitFunctionality6: IndependentFunctionalityViewController {
    private let userId: String
    private let timestamp: Date
    
    init(functionality: Functionality, userId: String, timestamp: Date, onDismiss: @escaping () -> Void) {
        self.userId = userId
        self.timestamp = timestamp
        super.init(functionality: functionality, onDismiss: onDismiss)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        let segmentedControl = UISegmentedControl(items: ["Option 1", "Option 2", "Option 3"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIKit Segmented Control"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        
        view.addSubview(segmentedControl)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            segmentedControl.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
}
