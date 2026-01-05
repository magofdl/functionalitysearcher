//
//  UIKitFunctionalityTemplate.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionalityTemplate: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomElements()
    }
    
    private func addCustomElements() {
        // Agregar elementos adicionales según la categoría para diferenciación visual
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = getCategoryAccentColor()
        
        // Select icon based on category
        let iconName: String
        switch functionality.category {
        case "Billing":
            iconName = "doc.text"
        case "Returns":
            iconName = "arrow.uturn.backward"
        case "Certificates":
            iconName = "checkmark.seal"
        case "Profile":
            iconName = "person.circle"
        case "Products":
            iconName = "cart"
        case "Orders":
            iconName = "bag"
        default:
            iconName = "star"
        }
        
        iconView.image = UIImage(systemName: iconName)
        view.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func getCategoryAccentColor() -> UIColor {
        switch functionality.category {
        case "Billing":
            return .systemBlue
        case "Returns":
            return .systemRed
        case "Certificates":
            return .systemGreen
        case "Profile":
            return .systemPurple
        case "Products":
            return .systemOrange
        case "Orders":
            return .systemIndigo
        default:
            return .systemGray
        }
    }
}
