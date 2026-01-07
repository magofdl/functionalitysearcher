import Foundation

/// Data resolver for UserAccountDetailsViewController (new version with external data)
/// Provides external data that is not stored in AppContext
class UserAccountDetailsViewControllerDataResolver: FunctionalityDataResolver {
    func resolveData(for functionality: Functionality, context: AppContext) -> [String: FunctionalityArgumentValue] {
        // Example: Fetch data from external source (API, database, etc.)
        // For this example, we'll simulate external data
        
        let orderHistory = fetchOrderHistory(userId: context.userId)
        let paymentMethods = fetchPaymentMethods(userId: context.userId)
        let loyaltyPoints = fetchLoyaltyPoints(userId: context.userId)
        
        return [
            "orderHistory": .dictionary([
                "totalOrders": .int(orderHistory.totalOrders),
                "lastOrderDate": .string(ISO8601DateFormatter().string(from: orderHistory.lastOrderDate)),
                "averageOrderValue": .double(orderHistory.averageOrderValue)
            ]),
            "paymentMethods": .array(paymentMethods.map { .string($0) }),
            "loyaltyPoints": .int(loyaltyPoints),
            "isVIP": .bool(loyaltyPoints > 1000)
        ]
    }
    
    // Simulated data fetching methods
    // In a real implementation, these would fetch from API, database, etc.
    private func fetchOrderHistory(userId: String) -> (totalOrders: Int, lastOrderDate: Date, averageOrderValue: Double) {
        // Simulate API call or database query
        return (totalOrders: 15, lastOrderDate: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), averageOrderValue: 89.50)
    }
    
    private func fetchPaymentMethods(userId: String) -> [String] {
        // Simulate external service call
        return ["Credit Card", "PayPal", "Apple Pay"]
    }
    
    private func fetchLoyaltyPoints(userId: String) -> Int {
        // Simulate database query
        return 1250
    }
}
