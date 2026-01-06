import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class ExternalDataFunctionalityTests: XCTestCase {
    
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
    
    // MARK: - SwiftUIFunctionality11 Tests
    
    func testSwiftUIFunctionality11Initialization() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_011",
            data: [
                "subscriptionTier": .string("premium"),
                "accountBalance": .double(1250.75)
            ]
        )
        
        let view = SwiftUIFunctionality11(
            functionality: functionality,
            userId: context.userId,
            onDismiss: nil
        )
        
        XCTAssertNotNil(view)
        XCTAssertEqual(view.functionality.code, "PROF_011")
        XCTAssertEqual(view.userId, context.userId)
    }
    
    func testSwiftUIFunctionality11DisplaysSubscriptionTier() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_011",
            data: [
                "subscriptionTier": .string("premium")
            ]
        )
        
        let view = SwiftUIFunctionality11(
            functionality: functionality,
            userId: context.userId,
            onDismiss: nil
        )
        
        XCTAssertNotNil(view.subscriptionTier)
        XCTAssertEqual(view.subscriptionTier, "premium")
    }
    
    func testSwiftUIFunctionality11DisplaysUserPreferences() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_011",
            data: [
                "userPreferences": .dictionary([
                    "theme": .string("dark"),
                    "language": .string("es"),
                    "notificationsEnabled": .bool(true)
                ])
            ]
        )
        
        let view = SwiftUIFunctionality11(
            functionality: functionality,
            userId: context.userId,
            onDismiss: nil
        )
        
        XCTAssertNotNil(view.userPreferences)
        XCTAssertEqual(view.userPreferences?.theme, "dark")
        XCTAssertEqual(view.userPreferences?.language, "es")
        XCTAssertEqual(view.userPreferences?.notificationsEnabled, true)
    }
    
    func testSwiftUIFunctionality11DisplaysAccountBalance() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_011",
            data: [
                "accountBalance": .double(1250.75)
            ]
        )
        
        let view = SwiftUIFunctionality11(
            functionality: functionality,
            userId: context.userId,
            onDismiss: nil
        )
        
        XCTAssertNotNil(view.accountBalance)
        XCTAssertEqual(view.accountBalance, 1250.75)
    }
    
    func testSwiftUIFunctionality11HandlesMissingData() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_011",
            data: [:]
        )
        
        let view = SwiftUIFunctionality11(
            functionality: functionality,
            userId: context.userId,
            onDismiss: nil
        )
        
        // Should handle missing data gracefully
        XCTAssertNil(view.subscriptionTier)
        XCTAssertNil(view.userPreferences)
        XCTAssertNil(view.accountBalance)
    }
    
    // MARK: - UIKitFunctionality10WithExternalData Tests
    
    func testUIKitFunctionality10WithExternalDataInitialization() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "loyaltyPoints": .int(1250),
                "isVIP": .bool(true)
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController.functionality.code, "PROF_010")
    }
    
    func testUIKitFunctionality10WithExternalDataDisplaysOrderHistory() {
        let formatter = ISO8601DateFormatter()
        let dateString = formatter.string(from: Date())
        
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "orderHistory": .dictionary([
                    "totalOrders": .int(15),
                    "lastOrderDate": .string(dateString),
                    "averageOrderValue": .double(89.50)
                ])
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController.orderHistory)
        XCTAssertEqual(viewController.orderHistory?.totalOrders, 15)
        XCTAssertEqual(viewController.orderHistory?.averageOrderValue, 89.50)
    }
    
    func testUIKitFunctionality10WithExternalDataDisplaysPaymentMethods() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "paymentMethods": .array([
                    .string("Credit Card"),
                    .string("PayPal"),
                    .string("Apple Pay")
                ])
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertFalse(viewController.paymentMethods.isEmpty)
        XCTAssertEqual(viewController.paymentMethods.count, 3)
        XCTAssertTrue(viewController.paymentMethods.contains("Credit Card"))
    }
    
    func testUIKitFunctionality10WithExternalDataDisplaysLoyaltyPoints() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "loyaltyPoints": .int(1250)
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.loyaltyPoints, 1250)
    }
    
    func testUIKitFunctionality10WithExternalDataDisplaysVIPStatus() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "loyaltyPoints": .int(1500),
                "isVIP": .bool(true)
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertTrue(viewController.isVIP)
    }
    
    func testUIKitFunctionality10WithExternalDataHandlesMissingData() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [:]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        // Should handle missing data gracefully
        XCTAssertNil(viewController.orderHistory)
        XCTAssertTrue(viewController.paymentMethods.isEmpty)
        XCTAssertEqual(viewController.loyaltyPoints, 0)
        XCTAssertFalse(viewController.isVIP)
    }
    
    func testUIKitFunctionality10WithExternalDataLoadsView() {
        let functionality = createFunctionalityWithExternalData(
            code: "PROF_010",
            data: [
                "loyaltyPoints": .int(1250),
                "isVIP": .bool(true),
                "paymentMethods": .array([.string("Credit Card")])
            ]
        )
        
        let viewController = UIKitFunctionality10WithExternalData(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        // Load the view to trigger viewDidLoad
        _ = viewController.view
        
        XCTAssertNotNil(viewController.view)
        XCTAssertNotNil(viewController.contentView)
    }
    
    // MARK: - Integration Tests
    
    func testEndToEndSwiftUIFunctionality11WithResolver() {
        let resolver = SwiftUIFunctionality11DataResolver()
        let factory = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_011": resolver
        ])
        
        let functionality = Functionality(
            id: "PROF_011",
            code: "PROF_011",
            name: "User preferences and subscription",
            path: "/profile/11",
            category: "Profile",
            description: "Test",
            keywords: [],
            uiType: .swiftui
        )
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIHostingController<SwiftUIFunctionality11>
        
        XCTAssertNotNil(viewController)
        
        let view = viewController?.rootView
        XCTAssertNotNil(view?.subscriptionTier)
        XCTAssertNotNil(view?.userPreferences)
        XCTAssertNotNil(view?.accountBalance)
    }
    
    func testEndToEndUIKitFunctionality10WithResolver() {
        let resolver = UIKitFunctionality10DataResolver()
        let factory = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_010": resolver
        ])
        
        let functionality = Functionality(
            id: "PROF_010",
            code: "PROF_010",
            name: "User account details with external data",
            path: "/profile/10",
            category: "Profile",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIKitFunctionality10WithExternalData
        
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController?.orderHistory)
        XCTAssertFalse(viewController?.paymentMethods.isEmpty ?? true)
        XCTAssertGreaterThan(viewController?.loyaltyPoints ?? 0, 0)
    }
    
    // MARK: - Helper Methods
    
    private func createFunctionalityWithExternalData(
        code: String,
        data: [String: FunctionalityArgumentValue]
    ) -> Functionality {
        Functionality(
            id: code,
            code: code,
            name: "Test Functionality",
            path: "/test/\(code)",
            category: "Test",
            description: "Test description",
            keywords: ["test"],
            uiType: .uikit,
            arguments: data
        )
    }
}
