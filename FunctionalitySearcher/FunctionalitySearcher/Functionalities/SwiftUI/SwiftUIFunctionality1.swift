//
//  SwiftUIFunctionality1.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality1: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 200, height: 150)
                        .shadow(radius: 10)
                    
                    Text("SwiftUI Card")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
            )
    }
}
