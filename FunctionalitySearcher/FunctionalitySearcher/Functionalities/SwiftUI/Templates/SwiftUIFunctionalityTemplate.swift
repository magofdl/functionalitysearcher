//
//  SwiftUIFunctionalityTemplate.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import SwiftUI

struct SwiftUIFunctionalityTemplate: View {
    let functionality: Functionality
    var onDismiss: (() -> Void)?
    
    var body: some View {
        SwiftUIFunctionalityScaffold(title: functionality.name, onDismiss: onDismiss) {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(functionality.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Category:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(functionality.category)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(categoryColor)
                    }
                    
                    HStack {
                        Text("Code:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(functionality.code)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    
                    Text("Path: \(functionality.path)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                    }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                
                Image(systemName: categoryIcon)
                    .font(.system(size: 34))
                    .foregroundColor(categoryColor)
                    .padding(12)
                }
        }
    }
    
    private var categoryIcon: String {
        switch functionality.category {
        case "Billing":
            return "doc.text.fill"
        case "Returns":
            return "arrow.uturn.backward.circle"
        case "Certificates":
            return "checkmark.seal.fill"
        case "Profile":
            return "person.circle.fill"
        case "Products":
            return "cart.fill"
        case "Orders":
            return "bag.fill"
        default:
            return "star.fill"
        }
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
}
