import SwiftUI

struct RenewCertificateView: View {
    let functionality: Functionality
    let userId: String
    let region: String
    var onDismiss: (() -> Void)?
    
    @State private var sliderValue: Double = 50
    
    var body: some View {
        SwiftUIFunctionalityScaffold(title: functionality.name, onDismiss: onDismiss) {
            VStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("User ID: \(userId)")
                            .font(.caption)
                        Text("Region: \(region)")
                            .font(.caption)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(8)
                    
                    VStack {
                        Text("SwiftUI Slider")
                            .font(.headline)
                        Slider(value: $sliderValue, in: 0...100)
                        Text("Value: \(Int(sliderValue))")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .padding()
            }
        }
    }
}
