import UIKit

class UIKitFunctionality9: IndependentFunctionalityViewController {
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
        let horizontalScrollView = UIScrollView()
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollView.showsHorizontalScrollIndicator = true
        
        let horizontalContentView = UIView()
        horizontalContentView.translatesAutoresizingMaskIntoConstraints = false
        
        var previousView: UIView?
        for i in 1...5 {
            let itemView = UIView()
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.backgroundColor = .systemBlue
            itemView.layer.cornerRadius = 8
            itemView.widthAnchor.constraint(equalToConstant: 120).isActive = true
            itemView.heightAnchor.constraint(equalToConstant: 120).isActive = true
            
            horizontalContentView.addSubview(itemView)
            if let previous = previousView {
                itemView.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: 16).isActive = true
            } else {
                itemView.leadingAnchor.constraint(equalTo: horizontalContentView.leadingAnchor).isActive = true
            }
            itemView.topAnchor.constraint(equalTo: horizontalContentView.topAnchor).isActive = true
            itemView.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor).isActive = true
            previousView = itemView
        }
        if let last = previousView {
            last.trailingAnchor.constraint(equalTo: horizontalContentView.trailingAnchor).isActive = true
        }
        
        horizontalScrollView.addSubview(horizontalContentView)
        view.addSubview(horizontalScrollView)
        
        NSLayoutConstraint.activate([
            horizontalScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalScrollView.widthAnchor.constraint(equalToConstant: 300),
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 140),
            
            horizontalContentView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
            horizontalContentView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
            horizontalContentView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor),
            horizontalContentView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
            horizontalContentView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor)
        ])
    }
}
