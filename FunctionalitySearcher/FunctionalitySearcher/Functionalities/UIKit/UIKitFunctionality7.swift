import UIKit

class UIKitFunctionality7: BaseFunctionalityViewController {
    private let userId: String
    private let region: String
    
    init(functionality: Functionality, userId: String, region: String, onDismiss: @escaping () -> Void) {
        self.userId = userId
        self.region = region
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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        gradientLayer.cornerRadius = 12
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        
        contentView.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
