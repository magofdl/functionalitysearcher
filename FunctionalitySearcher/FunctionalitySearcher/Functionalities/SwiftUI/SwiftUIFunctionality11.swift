import SwiftUI

struct SwiftUIFunctionality11: View {
    let functionality: Functionality
    let userId: String
    var onDismiss: (() -> Void)?
    
    // External data from resolver
    private var userPreferences: (theme: String, language: String, notificationsEnabled: Bool)? {
        guard let prefsDict = functionality.arguments["userPreferences"]?.dictionaryValue,
              let theme = prefsDict["theme"]?.stringValue,
              let language = prefsDict["language"]?.stringValue,
              let notificationsEnabled = prefsDict["notificationsEnabled"]?.boolValue else {
            return nil
        }
        return (theme: theme, language: language, notificationsEnabled: notificationsEnabled)
    }
    
    private var subscriptionTier: String? {
        functionality.arguments["subscriptionTier"]?.stringValue
    }
    
    private var lastLoginDate: String? {
        functionality.arguments["lastLoginDate"]?.stringValue
    }
    
    private var accountBalance: Double? {
        functionality.arguments["accountBalance"]?.doubleValue
    }
    
    var body: some View {
        BaseFunctionalityView(functionality: functionality, onDismiss: onDismiss)
            .overlay(
                ScrollView {
                    VStack(spacing: 20) {
                        // Subscription Tier Card
                        if let tier = subscriptionTier {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Subscription")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(tier.capitalized)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        // User Preferences
                        if let prefs = userPreferences {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Preferences")
                                    .font(.headline)
                                
                                HStack {
                                    Label("Theme", systemImage: "paintbrush.fill")
                                    Spacer()
                                    Text(prefs.theme.capitalized)
                                        .foregroundColor(.secondary)
                                }
                                
                                HStack {
                                    Label("Language", systemImage: "globe")
                                    Spacer()
                                    Text(prefs.language.uppercased())
                                        .foregroundColor(.secondary)
                                }
                                
                                HStack {
                                    Label("Notifications", systemImage: "bell.fill")
                                    Spacer()
                                    Image(systemName: prefs.notificationsEnabled ? "checkmark.circle.fill" : "xmark.circle.fill")
                                        .foregroundColor(prefs.notificationsEnabled ? .green : .red)
                                }
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        // Account Balance
                        if let balance = accountBalance {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Account Balance")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("$\(balance, specifier: "%.2f")")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        // Last Login
                        if let loginDate = lastLoginDate {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.secondary)
                                Text("Last login: \(formatDate(loginDate))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.secondary.opacity(0.05))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            )
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .short
            return displayFormatter.string(from: date)
        }
        return dateString
    }
}
