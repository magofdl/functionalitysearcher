import SwiftUI

struct InvoiceHistoryView: View {
    let functionality: Functionality
    let userId: String
    var onDismiss: (() -> Void)?
    
    var body: some View {
        SwiftUIFunctionalityScaffold(title: functionality.name, onDismiss: onDismiss) {
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
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
