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
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                // Agregar icono decorativo según categoría
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: categoryIcon)
                            .font(.system(size: 40))
                            .foregroundColor(categoryColor)
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                    }
                    Spacer()
                }
            )
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
