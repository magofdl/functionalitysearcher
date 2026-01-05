//
//  UIKitFunctionality2.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionality2: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        // Table view style layout
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGroupedBackground
        contentView.insertSubview(tableView, at: 0)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
