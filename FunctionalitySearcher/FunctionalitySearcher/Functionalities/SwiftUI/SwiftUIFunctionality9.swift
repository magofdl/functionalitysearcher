import SwiftUI

struct SwiftUIFunctionality9: View {
    let functionality: Functionality
    let userId: String
    let contractCount: Int
    var onDismiss: (() -> Void)?
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                VStack(spacing: 16) {
                    Text("Contracts: \(contractCount)")
                        .font(.caption)
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(8)
                    
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
                }
                .padding()
            )
    }
}
