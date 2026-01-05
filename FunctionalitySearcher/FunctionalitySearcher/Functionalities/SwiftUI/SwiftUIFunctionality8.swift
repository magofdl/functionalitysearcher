//
//  SwiftUIFunctionality8.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionality8: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    @State private var selectedDate = Date()
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    DatePicker("SwiftUI Date Picker", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                    
                    Text(selectedDate, style: .date)
                        .foregroundColor(.secondary)
                }
                .padding()
            )
    }
}
