//
//  SwiftUIFunctionality6.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality6: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    @State private var selectedSegment = 0
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    Picker("Options", selection: $selectedSegment) {
                        Text("Option 1").tag(0)
                        Text("Option 2").tag(1)
                        Text("Option 3").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    Text("Selected: Option \(selectedSegment + 1)")
                        .foregroundColor(.secondary)
                }
                .padding()
            )
    }
}
