//
//  BaseFunctionalityViewController.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class BaseFunctionalityViewController: UIViewController, FunctionalityViewControllerProtocol {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let codeLabel = UILabel()
    private let categoryLabel = UILabel()
    private let pathLabel = UILabel()
    private let dismissButton = UIButton(type: .system)
    
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
        setupUI()
        configureContent()
        applyCategoryStyle()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        // Description Label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .secondaryLabel
        contentView.addSubview(descriptionLabel)
        
        // Code Label
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.font = .systemFont(ofSize: 14, weight: .medium)
        codeLabel.textColor = .systemBlue
        contentView.addSubview(codeLabel)
        
        // Category Label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(categoryLabel)
        
        // Path Label
        pathLabel.translatesAutoresizingMaskIntoConstraints = false
        pathLabel.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
        pathLabel.textColor = .secondaryLabel
        pathLabel.numberOfLines = 0
        contentView.addSubview(pathLabel)
        
        // Dismiss Button
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitle("Done", for: .normal)
        dismissButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        dismissButton.backgroundColor = .systemBlue
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.layer.cornerRadius = 12
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        contentView.addSubview(dismissButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            codeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            codeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            categoryLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 16),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            pathLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            pathLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pathLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            dismissButton.topAnchor.constraint(equalTo: pathLabel.bottomAnchor, constant: 40),
            dismissButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func configureContent() {
        titleLabel.text = functionality.name
        descriptionLabel.text = functionality.description
        codeLabel.text = "Code: \(functionality.code)"
        categoryLabel.text = "Category: \(functionality.category)"
        pathLabel.text = "Path: \(functionality.path)"
    }
    
    private func applyCategoryStyle() {
        let backgroundColor: UIColor
        let accentColor: UIColor
        
        switch functionality.category {
        case "Billing":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemBlue
        case "Returns":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemRed
        case "Certificates":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemGreen
        case "Profile":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemPurple
        case "Products":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemOrange
        case "Orders":
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemIndigo
        default:
            backgroundColor = UIColor.white.withAlphaComponent(1.0)
            accentColor = .systemGray
        }
        
        view.backgroundColor = backgroundColor
        categoryLabel.textColor = accentColor
        dismissButton.backgroundColor = accentColor
    }
    
    @objc private func dismissTapped() {
        onDismiss?()
    }
    
    // MARK: - Argument Access Helpers
    
    /// Obtiene un argumento de tipo String
    func getStringArgument(_ key: String) -> String? {
        return functionality.arguments[key]?.stringValue
    }
    
    /// Obtiene un argumento de tipo Int
    func getIntArgument(_ key: String) -> Int? {
        return functionality.arguments[key]?.intValue
    }
    
    /// Obtiene un argumento de tipo Double
    func getDoubleArgument(_ key: String) -> Double? {
        return functionality.arguments[key]?.doubleValue
    }
    
    /// Obtiene un argumento de tipo Bool
    func getBoolArgument(_ key: String) -> Bool? {
        return functionality.arguments[key]?.boolValue
    }
    
    /// Obtiene un argumento de tipo Dictionary
    func getDictionaryArgument(_ key: String) -> [String: FunctionalityArgumentValue]? {
        return functionality.arguments[key]?.dictionaryValue
    }
    
    /// Obtiene un argumento de tipo Array
    func getArrayArgument(_ key: String) -> [FunctionalityArgumentValue]? {
        return functionality.arguments[key]?.arrayValue
    }
    
    /// Obtiene un argumento genérico
    func getArgument(_ key: String) -> FunctionalityArgumentValue? {
        return functionality.arguments[key]
    }
}
