//
//  FunctionalityViewControllerProtocol.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import UIKit

protocol FunctionalityViewControllerProtocol: UIViewController {
    var functionality: Functionality { get }
    var onDismiss: (() -> Void)? { get set }
}
