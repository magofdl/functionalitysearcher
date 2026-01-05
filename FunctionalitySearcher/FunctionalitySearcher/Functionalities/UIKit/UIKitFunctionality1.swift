//
//  UIKitFunctionality1.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionality1: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        // Card-based layout with shadow
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemBackground
        cardView.layer.cornerRadius = 16
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 8
        contentView.insertSubview(cardView, at: 0)
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 300),
            cardView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
