//
//  FunctionalityFactoryProtocol.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

protocol FunctionalityFactoryProtocol {
    func createViewController(for functionality: Functionality, onDismiss: @escaping () -> Void) -> UIViewController
}
