//
//  SwiftUIFunctionality2.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality2: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 16) {
                    ForEach(1...3, id: \.self) { index in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("SwiftUI List Item \(index)")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                    }
                }
                .padding()
            )
    }
}
