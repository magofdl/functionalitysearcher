//
//  SwiftUIFunctionality3.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality3: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    @State private var sliderValue: Double = 50
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 30) {
                    VStack {
                        Text("SwiftUI Slider")
                            .font(.headline)
                        Slider(value: $sliderValue, in: 0...100)
                        Text("Value: \(Int(sliderValue))")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .padding()
                }
            )
    }
}
