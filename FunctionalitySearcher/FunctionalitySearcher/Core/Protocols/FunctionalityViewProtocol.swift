//
//  FunctionalityViewProtocol.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

protocol FunctionalityViewProtocol: View {
    var functionality: Functionality { get }
    var onDismiss: (() -> Void)? { get set }
}
