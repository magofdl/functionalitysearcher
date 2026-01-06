import Foundation

/// Data resolver for SwiftUIFunctionality11
/// Provides external data that is not stored in AppContext
class SwiftUIFunctionality11DataResolver: FunctionalityDataResolver {
    func resolveData(for functionality: Functionality, context: AppContext) -> [String: FunctionalityArgumentValue] {
        // Example: Fetch data from external source (API, database, etc.)
        // For this example, we'll simulate external data
        
        let userPreferences = fetchUserPreferences(userId: context.userId)
        let subscriptionTier = fetchSubscriptionTier(userId: context.userId)
        let lastLoginDate = fetchLastLoginDate(userId: context.userId)
        
        return [
            "userPreferences": .dictionary([
                "theme": .string(userPreferences.theme),
                "language": .string(userPreferences.language),
                "notificationsEnabled": .bool(userPreferences.notificationsEnabled)
            ]),
            "subscriptionTier": .string(subscriptionTier),
            "lastLoginDate": .string(ISO8601DateFormatter().string(from: lastLoginDate)),
            "accountBalance": .double(1250.75)
        ]
    }
    
    // Simulated data fetching methods
    // In a real implementation, these would fetch from API, database, etc.
    private func fetchUserPreferences(userId: String) -> (theme: String, language: String, notificationsEnabled: Bool) {
        // Simulate API call or database query
        return ("dark", "es", true)
    }
    
    private func fetchSubscriptionTier(userId: String) -> String {
        // Simulate external service call
        return "premium"
    }
    
    private func fetchLastLoginDate(userId: String) -> Date {
        // Simulate database query
        return Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
    }
}
