import SwiftUI

/// Minimal scaffold for fully independent SwiftUI functionality screens.
/// It intentionally does NOT show BaseFunctionalityView to avoid stacking/overlays.
struct SwiftUIFunctionalityScaffold<Content: View>: View {
    let title: String
    var onDismiss: (() -> Void)?
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    content()
                }
                .padding()
            }
            
            Button(action: { onDismiss?() }) {
                Text("Back to Searcher")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding([.horizontal, .bottom])
                    .padding(.top, 8)
            }
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}

