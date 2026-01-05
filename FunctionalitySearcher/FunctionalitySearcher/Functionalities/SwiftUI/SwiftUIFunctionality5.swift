//
//  SwiftUIFunctionality5.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality5: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    @State private var isToggleOn = true
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    Toggle("SwiftUI Toggle", isOn: $isToggleOn)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                    
                    Stepper(value: .constant(5), in: 0...10) {
                        Text("SwiftUI Stepper")
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                }
                .padding()
            )
    }
}
