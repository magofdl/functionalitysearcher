import XCTest
@testable import FunctionalitySearcher

final class FunctionalityDataResolverTests: XCTestCase {
    
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        context = AppContext(
            userId: "TEST-USER-123",
            timestamp: Date(),
            region: "US",
            contractCount: 5,
            userEmail: "test@example.com",
            userRole: "admin"
        )
    }
    
    override func tearDown() {
        context = nil
        super.tearDown()
    }
    
    // MARK: - SwiftUIFunctionality11DataResolver Tests
    
    func testSwiftUIFunctionality11DataResolverResolvesData() {
        let resolver = SwiftUIFunctionality11DataResolver()
        let functionality = createMockFunctionality(code: "PROF_011")
        
        let data = resolver.resolveData(for: functionality, context: context)
        
        XCTAssertFalse(data.isEmpty, "Resolver should return data")
        XCTAssertNotNil(data["userPreferences"], "Should include userPreferences")
        XCTAssertNotNil(data["subscriptionTier"], "Should include subscriptionTier")
        XCTAssertNotNil(data["lastLoginDate"], "Should include lastLoginDate")
        XCTAssertNotNil(data["accountBalance"], "Should include accountBalance")
    }
    
    func testSwiftUIFunctionality11DataResolverUserPreferences() {
        let resolver = SwiftUIFunctionality11DataResolver()
        let functionality = createMockFunctionality(code: "PROF_011")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let prefs = data["userPreferences"]?.dictionaryValue
        
        XCTAssertNotNil(prefs, "userPreferences should be a dictionary")
        XCTAssertNotNil(prefs?["theme"]?.stringValue, "Should have theme")
        XCTAssertNotNil(prefs?["language"]?.stringValue, "Should have language")
        XCTAssertNotNil(prefs?["notificationsEnabled"]?.boolValue, "Should have notificationsEnabled")
    }
    
    func testSwiftUIFunctionality11DataResolverSubscriptionTier() {
        let resolver = SwiftUIFunctionality11DataResolver()
        let functionality = createMockFunctionality(code: "PROF_011")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let tier = data["subscriptionTier"]?.stringValue
        
        XCTAssertNotNil(tier, "Should have subscriptionTier")
        XCTAssertFalse(tier!.isEmpty, "Subscription tier should not be empty")
    }
    
    func testSwiftUIFunctionality11DataResolverAccountBalance() {
        let resolver = SwiftUIFunctionality11DataResolver()
        let functionality = createMockFunctionality(code: "PROF_011")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let balance = data["accountBalance"]?.doubleValue
        
        XCTAssertNotNil(balance, "Should have accountBalance")
        XCTAssertGreaterThan(balance!, 0, "Balance should be positive")
    }
    
    // MARK: - UIKitFunctionality10DataResolver Tests
    
    func testUIKitFunctionality10DataResolverResolvesData() {
        let resolver = UIKitFunctionality10DataResolver()
        let functionality = createMockFunctionality(code: "PROF_010")
        
        let data = resolver.resolveData(for: functionality, context: context)
        
        XCTAssertFalse(data.isEmpty, "Resolver should return data")
        XCTAssertNotNil(data["orderHistory"], "Should include orderHistory")
        XCTAssertNotNil(data["paymentMethods"], "Should include paymentMethods")
        XCTAssertNotNil(data["loyaltyPoints"], "Should include loyaltyPoints")
        XCTAssertNotNil(data["isVIP"], "Should include isVIP")
    }
    
    func testUIKitFunctionality10DataResolverOrderHistory() {
        let resolver = UIKitFunctionality10DataResolver()
        let functionality = createMockFunctionality(code: "PROF_010")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let history = data["orderHistory"]?.dictionaryValue
        
        XCTAssertNotNil(history, "orderHistory should be a dictionary")
        XCTAssertNotNil(history?["totalOrders"]?.intValue, "Should have totalOrders")
        XCTAssertNotNil(history?["lastOrderDate"]?.stringValue, "Should have lastOrderDate")
        XCTAssertNotNil(history?["averageOrderValue"]?.doubleValue, "Should have averageOrderValue")
        
        let totalOrders = history?["totalOrders"]?.intValue
        XCTAssertGreaterThan(totalOrders!, 0, "Total orders should be positive")
    }
    
    func testUIKitFunctionality10DataResolverPaymentMethods() {
        let resolver = UIKitFunctionality10DataResolver()
        let functionality = createMockFunctionality(code: "PROF_010")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let methods = data["paymentMethods"]?.arrayValue
        
        XCTAssertNotNil(methods, "paymentMethods should be an array")
        XCTAssertFalse(methods!.isEmpty, "Should have at least one payment method")
        
        let firstMethod = methods?.first?.stringValue
        XCTAssertNotNil(firstMethod, "Payment methods should be strings")
    }
    
    func testUIKitFunctionality10DataResolverLoyaltyPoints() {
        let resolver = UIKitFunctionality10DataResolver()
        let functionality = createMockFunctionality(code: "PROF_010")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let points = data["loyaltyPoints"]?.intValue
        
        XCTAssertNotNil(points, "Should have loyaltyPoints")
        XCTAssertGreaterThanOrEqual(points!, 0, "Loyalty points should be non-negative")
    }
    
    func testUIKitFunctionality10DataResolverIsVIP() {
        let resolver = UIKitFunctionality10DataResolver()
        let functionality = createMockFunctionality(code: "PROF_010")
        
        let data = resolver.resolveData(for: functionality, context: context)
        let isVIP = data["isVIP"]?.boolValue
        
        XCTAssertNotNil(isVIP, "Should have isVIP flag")
    }
    
    // MARK: - Mock Resolver Tests
    
    func testMockResolver() {
        let mockResolver = MockFunctionalityDataResolver(data: [
            "testKey": .string("testValue"),
            "testInt": .int(42)
        ])
        
        let functionality = createMockFunctionality(code: "TEST")
        let data = mockResolver.resolveData(for: functionality, context: context)
        
        XCTAssertEqual(data["testKey"]?.stringValue, "testValue")
        XCTAssertEqual(data["testInt"]?.intValue, 42)
    }
    
    // MARK: - Helper Methods
    
    private func createMockFunctionality(code: String) -> Functionality {
        Functionality(
            id: code,
            code: code,
            name: "Test Functionality",
            path: "/test/\(code)",
            category: "Test",
            description: "Test description",
            keywords: ["test"],
            uiType: .uikit
        )
    }
}

// MARK: - Mock Resolver for Testing

class MockFunctionalityDataResolver: FunctionalityDataResolver {
    private let data: [String: FunctionalityArgumentValue]
    
    init(data: [String: FunctionalityArgumentValue]) {
        self.data = data
    }
    
    func resolveData(for functionality: Functionality, context: AppContext) -> [String: FunctionalityArgumentValue] {
        return data
    }
}
