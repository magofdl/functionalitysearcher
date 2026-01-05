import SwiftUI

struct SwiftUIFunctionality1: View {
    let functionality: Functionality
    let userId: String
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 200, height: 150)
                        .shadow(radius: 10)
                    
                    Text("SwiftUI Card")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("User ID:")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text(userId)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(8)
                }
                .padding()
            )
    }
}
