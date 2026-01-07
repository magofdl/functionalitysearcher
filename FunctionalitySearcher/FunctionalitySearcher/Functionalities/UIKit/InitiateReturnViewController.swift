import UIKit

class InitiateReturnViewController: IndependentFunctionalityViewController {
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
        displayUserInfo()
    }
    
    private func setupCustomLayout() {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGroupedBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func displayUserInfo() {
        print("User ID: \(userId)")
        print("Timestamp: \(timestamp)")
    }
}
