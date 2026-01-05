//
//  SwiftUIFunctionality4.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality4: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 16) {
                        ForEach(1...5, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.7))
                                .frame(width: 120, height: 120)
                                .overlay(
                                    Text("Item \(index)")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                )
                        }
                    }
                    .padding()
                }
                .padding()
            )
    }
}
