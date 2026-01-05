//
//  BaseFunctionalityView.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct BaseFunctionalityView: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(functionality.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text(functionality.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Label("Code: \(functionality.code)", systemImage: "number")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Label("Category: \(functionality.category)", systemImage: "folder")
                    .font(.headline)
                    .foregroundColor(categoryColor)
                
                Text("Path: \(functionality.path)")
                    .font(.system(.caption, design: .monospaced))
                    .foregroundColor(.secondary)
                
                Button(action: {
                    onDismiss?()
                }) {
                    Text("Back to Searcher")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(categoryColor)
                        .cornerRadius(12)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .background(categoryBackgroundColor)
        .navigationTitle(functionality.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var categoryColor: Color {
        switch functionality.category {
        case "Billing":
            return .blue
        case "Returns":
            return .red
        case "Certificates":
            return .green
        case "Profile":
            return .purple
        case "Products":
            return .orange
        case "Orders":
            return .indigo
        default:
            return .gray
        }
    }
    
    private var categoryBackgroundColor: Color {
        switch functionality.category {
        case "Billing":
            return Color.blue.opacity(0.1)
        case "Returns":
            return Color.red.opacity(0.1)
        case "Certificates":
            return Color.green.opacity(0.1)
        case "Profile":
            return Color.purple.opacity(0.1)
        case "Products":
            return Color.orange.opacity(0.1)
        case "Orders":
            return Color.indigo.opacity(0.1)
        default:
            return Color.gray.opacity(0.1)
        }
    }
}
