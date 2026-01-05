//
//  UIKitFunctionality5.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

class UIKitFunctionality5: BaseFunctionalityViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        // Progress indicators
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.6
        progressView.progressTintColor = .systemGreen
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        contentView.insertSubview(progressView, at: 0)
        contentView.insertSubview(activityIndicator, at: 0)
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            progressView.widthAnchor.constraint(equalToConstant: 250),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 30)
        ])
    }
}
