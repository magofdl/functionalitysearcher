//
//  UIKitFunctionality10.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionality10: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        // Date picker
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIKit Date Picker"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        
        contentView.insertSubview(datePicker, at: 0)
        contentView.insertSubview(label, at: 0)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            datePicker.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
