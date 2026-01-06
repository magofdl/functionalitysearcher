import UIKit

class UIKitFunctionality5: IndependentFunctionalityViewController {
    private let userId: String
    private let contractCount: Int
    
    init(functionality: Functionality, userId: String, contractCount: Int, onDismiss: @escaping () -> Void) {
        self.userId = userId
        self.contractCount = contractCount
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
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.6
        progressView.progressTintColor = .systemGreen
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        view.addSubview(progressView)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            progressView.widthAnchor.constraint(equalToConstant: 250),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 30)
        ])
    }
}
