import UIKit

/// UIKitFunctionality10 version that uses external data from resolver
/// This demonstrates how functionalities can access data not stored in AppContext
class UIKitFunctionality10WithExternalData: IndependentFunctionalityViewController {
    private let userId: String
    
    // External data from resolver (accessed via functionality.arguments) - internal for testing
    var orderHistory: (totalOrders: Int, lastOrderDate: Date, averageOrderValue: Double)? {
        guard let historyDict = functionality.arguments["orderHistory"]?.dictionaryValue,
              let totalOrders = historyDict["totalOrders"]?.intValue,
              let lastOrderDateString = historyDict["lastOrderDate"]?.stringValue,
              let lastOrderDate = ISO8601DateFormatter().date(from: lastOrderDateString),
              let averageOrderValue = historyDict["averageOrderValue"]?.doubleValue else {
            return nil
        }
        return (totalOrders: totalOrders, lastOrderDate: lastOrderDate, averageOrderValue: averageOrderValue)
    }
    
    var paymentMethods: [String] {
        functionality.arguments["paymentMethods"]?.arrayValue?.compactMap { $0.stringValue } ?? []
    }
    
    var loyaltyPoints: Int {
        functionality.arguments["loyaltyPoints"]?.intValue ?? 0
    }
    
    var isVIP: Bool {
        functionality.arguments["isVIP"]?.boolValue ?? false
    }
    
    init(functionality: Functionality, userId: String, onDismiss: @escaping () -> Void) {
        self.userId = userId
        super.init(functionality: functionality, onDismiss: onDismiss)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
        displayExternalData()
    }
    
    private func setupCustomLayout() {
        view.backgroundColor = .systemBackground
    }
    
    private func displayExternalData() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        var previousView: UIView?
        
        // VIP Badge
        if isVIP {
            let vipBadge = createVIPBadge()
            containerView.addSubview(vipBadge)
            NSLayoutConstraint.activate([
                vipBadge.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
                vipBadge.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                vipBadge.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
            ])
            previousView = vipBadge
        }
        
        // Loyalty Points Card
        let pointsCard = createLoyaltyPointsCard()
        containerView.addSubview(pointsCard)
        if let previous = previousView {
            NSLayoutConstraint.activate([
                pointsCard.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 16),
                pointsCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                pointsCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
            ])
        } else {
            NSLayoutConstraint.activate([
                pointsCard.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
                pointsCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                pointsCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
            ])
        }
        previousView = pointsCard
        
        // Order History Card
        if let history = orderHistory {
            let historyCard = createOrderHistoryCard(history: history)
            containerView.addSubview(historyCard)
            NSLayoutConstraint.activate([
                historyCard.topAnchor.constraint(equalTo: previousView!.bottomAnchor, constant: 16),
                historyCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                historyCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
            ])
            previousView = historyCard
        }
        
        // Payment Methods Card
        if !paymentMethods.isEmpty {
            let paymentCard = createPaymentMethodsCard()
            containerView.addSubview(paymentCard)
            NSLayoutConstraint.activate([
                paymentCard.topAnchor.constraint(equalTo: previousView!.bottomAnchor, constant: 16),
                paymentCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
                paymentCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
                paymentCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
            ])
        } else {
            previousView?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func createVIPBadge() -> UIView {
        let container = UIView()
        container.backgroundColor = .systemYellow
        container.layer.cornerRadius = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "⭐ VIP MEMBER ⭐"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12)
        ])
        
        return container
    }
    
    private func createLoyaltyPointsCard() -> UIView {
        let container = UIView()
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 12
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Loyalty Points"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let pointsLabel = UILabel()
        pointsLabel.text = "\(loyaltyPoints)"
        pointsLabel.font = .systemFont(ofSize: 32, weight: .bold)
        pointsLabel.textColor = .systemBlue
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(titleLabel)
        container.addSubview(pointsLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            pointsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            pointsLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            pointsLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            pointsLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        return container
    }
    
    private func createOrderHistoryCard(history: (totalOrders: Int, lastOrderDate: Date, averageOrderValue: Double)) -> UIView {
        let container = UIView()
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 12
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Order History"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let totalOrdersLabel = UILabel()
        totalOrdersLabel.text = "Total Orders: \(history.totalOrders)"
        totalOrdersLabel.font = .systemFont(ofSize: 14)
        totalOrdersLabel.textColor = .secondaryLabel
        
        let lastOrderLabel = UILabel()
        lastOrderLabel.text = "Last Order: \(formatter.string(from: history.lastOrderDate))"
        lastOrderLabel.font = .systemFont(ofSize: 14)
        lastOrderLabel.textColor = .secondaryLabel
        
        let avgOrderLabel = UILabel()
        avgOrderLabel.text = String(format: "Avg Order Value: $%.2f", history.averageOrderValue)
        avgOrderLabel.font = .systemFont(ofSize: 14)
        avgOrderLabel.textColor = .secondaryLabel
        
        stackView.addArrangedSubview(totalOrdersLabel)
        stackView.addArrangedSubview(lastOrderLabel)
        stackView.addArrangedSubview(avgOrderLabel)
        
        container.addSubview(titleLabel)
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        return container
    }
    
    private func createPaymentMethodsCard() -> UIView {
        let container = UIView()
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 12
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Payment Methods"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for method in paymentMethods {
            let methodLabel = UILabel()
            methodLabel.text = "• \(method)"
            methodLabel.font = .systemFont(ofSize: 14)
            methodLabel.textColor = .secondaryLabel
            stackView.addArrangedSubview(methodLabel)
        }
        
        container.addSubview(titleLabel)
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        return container
    }
}
