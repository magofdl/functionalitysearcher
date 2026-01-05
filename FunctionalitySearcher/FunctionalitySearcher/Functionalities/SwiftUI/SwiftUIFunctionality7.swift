//
//  SwiftUIFunctionality7.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality7: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 16) {
                    ProgressView(value: 0.6)
                        .progressViewStyle(.linear)
                    
                    ProgressView()
                        .scaleEffect(1.5)
                    
                    Text("SwiftUI Progress")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .padding()
            )
    }
}
