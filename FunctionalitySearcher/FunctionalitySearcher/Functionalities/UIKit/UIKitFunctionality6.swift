//
//  UIKitFunctionality6.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionality6: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        // Segmented control with labels
        let segmentedControl = UISegmentedControl(items: ["Option 1", "Option 2", "Option 3"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIKit Segmented Control"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        
        contentView.insertSubview(segmentedControl, at: 0)
        contentView.insertSubview(label, at: 0)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            segmentedControl.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
}
