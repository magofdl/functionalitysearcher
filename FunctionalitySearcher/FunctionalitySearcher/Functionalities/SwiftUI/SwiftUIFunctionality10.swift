//
//  SwiftUIFunctionality10.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality10: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            Label("Like", systemImage: "heart.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red.opacity(0.2))
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {}) {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                        }
                    }
                    
                    Text("SwiftUI Button Styles")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
            )
    }
}
