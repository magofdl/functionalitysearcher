//
//  SwiftUIFunctionality9.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality9: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(1...6, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.6))
                            .frame(height: 100)
                            .overlay(
                                Text("\(index)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            )
                    }
                }
                .padding()
            )
    }
}
