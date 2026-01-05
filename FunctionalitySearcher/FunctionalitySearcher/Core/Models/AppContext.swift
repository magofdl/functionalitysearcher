import Foundation

struct AppContext {
    let userId: String
    let timestamp: Date
    let region: String
    let contractCount: Int
    let userEmail: String?
    let userRole: String?
    
    static var current: AppContext {
        AppContext(
            userId: "USER-\(UUID().uuidString.prefix(8))",
            timestamp: Date(),
            region: Locale.current.region?.identifier ?? "US",
            contractCount: Int.random(in: 1...10),
            userEmail: "user@example.com",
            userRole: "customer"
        )
    }
}
